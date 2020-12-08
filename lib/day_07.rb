require "set"

module Arihunta
  module AdventOfCode2020
    NodePattern = /(\w+ \w+) bags contain (?:no other bags|(\d+ \w+ \w+ bags?(?:, \d+ \w+ \w+ bags?)*))./
    ListItemPattern = /(\d+) (\w+ \w+) bags?/

    class Day07
      def self._01(data)
        parents = Hash.new([])
        File.read(data).split("\n")
          .map { |group| group.match(NodePattern) }
          .each { |match|
            if match[2] != nil
              match[2].split(/, /)
                .map { |listItem| listItem.strip.match(ListItemPattern)[2] }
                .each { |childItem| parents[childItem] = parents[childItem] + [match[1]] }
            end
          }
        visited = Set.new
        queue = ["shiny gold"]
        while queue.size > 0
          parents[queue.pop].each { |item| queue.push(item) if visited.add?(item) }
        end
        visited.size
      end

      def self._02(data)
        graph = File.read(data).split("\n")
          .map { |group| group.match(NodePattern) }
          .to_h { |match| [match[1], match[2]] }
          .transform_values { |value|
            value == nil ? {} :
              value.split(/, /)
                .map { |listItem| listItem.strip.match(ListItemPattern) }
                .to_h { |listItemMatch| [listItemMatch[2], listItemMatch[1].to_i] }
          }
        solve_recursive("shiny gold", graph) - 1
      end

      def self.solve_recursive(key, hash)
        1 + hash[key].keys.map { |child| hash[key][child] * solve_recursive(child, hash) }.sum
      end
    end
  end
end
