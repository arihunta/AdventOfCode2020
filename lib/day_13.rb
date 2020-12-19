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
      end
    end
  end
end
