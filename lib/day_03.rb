require "set"
require "pry"

module Arihunta
  module AdventOfCode2020
    class Day03
      def self._01(data)
        solve(3, 1, data)
      end

      def self._02(data)
        solve(1, 1, data) * solve(3, 1, data) * solve(5, 1, data) * solve(7, 1, data) * solve(1, 2, data) 
      end

      def self.solve(x_step, y_step, data)
        x_idx = 0
        y_idx = 0
        File.readlines(data).map { |line|
          line.strip.chars
        }.map { |chars|
          if y_idx == 0
            is_tree = chars[x_idx] == '#'
            x_idx = (x_idx + x_step) % chars.size
          else
            is_tree = false
          end
          y_idx = (y_idx + 1) % y_step
          is_tree
        }.select { |is_tree|
          is_tree
        }.size
      end
    end
  end
end
