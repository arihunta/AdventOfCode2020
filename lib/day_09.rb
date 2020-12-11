module Arihunta
  module AdventOfCode2020
    class Day09
      def self._01(data, window_size)
        numbers = File.readlines(data)
          .map { |line| line.to_i }
        find_invalid_number(numbers, window_size)
      end

      def self._02(data, window_size)
        numbers = File.readlines(data)
          .map { |line| line.to_i }
        target = find_invalid_number(numbers, window_size)
        l_idx = r_idx = 0
        sum = numbers[r_idx]
        while r_idx < numbers.size
          if sum == target
            range = numbers[l_idx..r_idx].sort
            return range[0] + range[range.size - 1]
          elsif sum < target
            r_idx = r_idx + 1
            sum = sum + numbers[r_idx]
          elsif sum > target
            sum = sum - numbers[l_idx]
            l_idx = l_idx + 1
          end
        end
      end

      def self.find_invalid_number(numbers, window_size)
        window = numbers[0, window_size]
        for idx in window_size..numbers.size
          return numbers[idx] unless window.any? { |tnum|
            ((numbers[idx] - tnum) != tnum) && (window.find_index(numbers[idx] - tnum) != nil)
          }
          window.shift
          window.push(numbers[idx])
        end
      end
    end
  end
end
