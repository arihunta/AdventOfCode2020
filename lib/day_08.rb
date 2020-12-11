require "set"

module Arihunta
  module AdventOfCode2020
    class Day08
      InstructionPattern = /(nop|acc|jmp) ((?:\+|-)\d+)/

      def self._01(data)
        program = File.readlines(data)
          .map { |line| line.match(InstructionPattern) }
          .map { |match| [match[1], match[2].to_i] }
        acc = 0
        pc = 0
        visited = Set[0]
        while true
          case program[pc][0]
          when "nop"
            pc = pc + 1
          when "acc"
            acc = acc + program[pc][1]
            pc = pc + 1
          when "jmp"
            pc = pc + program[pc][1]
          end
          return acc if visited.include?(pc)
          visited << pc
        end
      end

      def self._02(data)
        program = File.readlines(data)
          .map { |line| line.match(InstructionPattern) }
          .map { |match| [match[1], match[2].to_i] }
        return traverse_pre_flip(0, 0, program, Set.new, Set.new)
      end

      def self.traverse_pre_flip(acc, pc, graph, visited, pre_visited)
        return nil if pre_visited.include?(pc)

        pre_visited << pc

        case graph[pc][0]
        when "nop"
          pre_ans = traverse_pre_flip(acc, pc + 1, graph, visited, pre_visited)
          return pre_ans if pre_ans != nil
          return traverse_post_flip(acc, pc + graph[pc][1], graph, visited)
        when "jmp"
          pre_ans = traverse_pre_flip(acc, pc + graph[pc][1], graph, visited, pre_visited)
          return pre_ans if pre_ans != nil
          return traverse_post_flip(acc, pc + 1, graph, visited)
        else
          return traverse_pre_flip(acc + graph[pc][1], pc + 1, graph, visited, pre_visited)
        end
      end

      def self.traverse_post_flip(acc, pc, graph, visited)
        return acc if pc == graph.size
        return nil if pc < 0 || pc > graph.size
        return nil if visited.include?(pc)

        visited << pc

        case graph[pc][0]
        when "nop"
          return traverse_post_flip(acc, pc + 1, graph, visited)
        when "acc"
          return traverse_post_flip(acc + graph[pc][1], pc + 1, graph, visited)
        when "jmp"
          return traverse_post_flip(acc, pc + graph[pc][1], graph, visited)
        end
      end
    end
  end
end
