require 'set'

module Arihunta
  module AdventOfCode2020
    class Day16
      RulePattern = /(.*?): (\d+-\d+(?: or \d+-\d+)*)/

      def self._01(data)
        rules, my_ticket, tickets = read_input(data)
        ranges = rules.values.flatten
        tickets.flatten.reject { |value| ranges.any? { |range| range.include?(value) } }.sum
      end

      def self._02(data)
        rules, my_ticket, tickets = read_input(data)

        # remove invalid tickets
        ranges = rules.values.flatten
        tickets = tickets.reject { |ticket|
          ticket.any? { |value|
            !ranges.any? { |range|
              range.include?(value)
            }
          }
        }
        tickets << my_ticket

        # determine possible fields for each column
        possibilities = (0..my_ticket.size - 1).map { |column|
          [column, rules.select { |name, vals|
            tickets.all? { |ticket|
              vals.any? { |range|
                range.include?(ticket[column])
              }
            }
          }.keys.to_set]
        }.to_h

        queue = possibilities.select { |k, v| v.size == 1 }.to_a
        field_map = Hash.new

        # determine which column each field represents
        while queue.size > 0
          nxt = queue.shift
          nxt[1] = nxt[1].to_a[0]
          field_map[nxt[1]] = nxt[0]
          possibilities.each { |rule_list|
            rule_list[1] = rule_list[1].delete(nxt[1])
            if rule_list[1].size == 1
              queue.push(rule_list)
            end
          }
        end

        # find answer
        field_map.select { |key, val| key.start_with?("departure") }
          .map { |key, val| my_ticket[val] }
          .reduce { |a, b| a * b }

      end

      def self.read_input(data)
        file = File.open(data)

        rules = Hash.new
        next_line = file.readline.strip
        while next_line != ""
          match = next_line.match(RulePattern)
          ranges = match[2].split(" or ")
            .map { |range| range.split("-").map { |bound| bound.to_i } }
            .map { |range| range[0]..range[1] }
          rules[match[1]] = ranges
          next_line = file.readline.strip
        end

        file.readline
        my_ticket = file.readline.strip.split(",").map { |field| field.to_i }
        file.readline
        file.readline

        tickets = []
        begin
          next_line = file.readline.strip
          while true
            tickets.push(next_line.split(",").map { |field| field.to_i })
            next_line = file.readline.strip
          end
        rescue EOFError
        end
        [rules, my_ticket, tickets]
      end
    end
  end
end
