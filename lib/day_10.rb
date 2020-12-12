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
        adapters.unshift(0)
        adapters.push(adapters.last + 3)
        paths = Array.new(adapters.size) { 0 }
        paths[0] = 1
        for idx in 0..(adapters.size - 2)
          paths[idx + 1] = paths[idx + 1] + paths[idx] if idx < adapters.size - 1
          paths[idx + 2] = paths[idx + 2] + paths[idx] if idx < adapters.size - 2 && adapters[idx + 2] - adapters[idx] <= 3
          paths[idx + 3] = paths[idx + 3] + paths[idx] if idx < adapters.size - 3 && adapters[idx + 3] - adapters[idx] <= 3
        end
        paths.last
      end
    end
  end
end
