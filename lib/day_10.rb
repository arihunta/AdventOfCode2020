module Arihunta
  module AdventOfCode2020
    class Day10
      def self._01(data)
        adapters = File.readlines(data).map { |line| line.to_i }.sort
        adapters.unshift(0)
        ones = 0
        threes = 1
        (1..adapters.size - 1).each { |idx|
          ones = ones + 1 if adapters[idx] - adapters[idx - 1] == 1
          threes = threes + 1 if adapters[idx] - adapters[idx - 1] == 3
        }
        ones * threes
      end

      def self._02(data)
        adapters = File.readlines(data).map { |line| line.to_i }.sort
        isles = (1..adapters.size - 2)
          .map { |idx| (adapters[idx + 1] - adapters[idx - 1] > 3) ? 0 : idx }
          .join(" ").split(/ 0(?: 0)* /)
          .map { |island| island.strip.split(" ").map { |idx| idx.to_i }.reject { |idx| idx == 0 } }
          .reject { |island| island.size == 0 }
          .map { |island| adapters[(island[0] - 1)..((island[island.size - 1] + 1))] }
          .map { |island| island.map { |num| num - island[0] } }
        idxes = isles
          .map { |island| solve(island) }
          .reduce { |a, b| a * b }
        puts ""
        puts "#{adapters}"
        puts "#{isles}"
        idxes
      end

      def self.solve(array)
        if array == [0, 1, 2]
          2
        elsif array == [0, 1, 2, 3]
          4
        elsif array == [0, 1, 2, 3, 4]
          7
        else
          raise "ERROR"
        end
      end
    end
  end
end
