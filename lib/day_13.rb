module Arihunta
  module AdventOfCode2020
    class Day13
      def self._01(data)
        lines = File.readlines(data)
        time = lines[0].to_i
        min_wait_id = lines[1].split(",")
          .reject { |id| id == "x" }
          .map { |id| id.to_i }
          .map { |id| [id, id - time % id] }
          .sort { |a, b| a[1] <=> b[1] }
          .first
        min_wait_id[0] * min_wait_id[1]
      end

      def self._02(data)
        lines = File.readlines(data)[1].split(",")
          .each_with_index
          .collect { |x, idx| [x != 'x' ? x.to_i : x, idx] }
          .reject { |x| x[0] == 'x' }
          .sort { |a, b| b[0] <=> a[0] }
        largest = lines.shift
        current_time = largest[0] - largest[1]
        step_size = largest[0]
        lines.each { |x|
          while (current_time + x[1]) % x[0] != 0 do
            current_time += step_size
          end
          step_size *= x[0]
        }
        current_time
      end
    end
  end
end
