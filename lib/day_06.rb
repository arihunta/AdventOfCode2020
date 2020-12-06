module Arihunta
  module AdventOfCode2020
    class Day06
      def self._01(data)
        File.read(data).split("\n\n").map { |group|
          group.gsub(/\s/, "").chars.sort.to_set.size
        }.sum
      end

      def self._02(data)
        File.read(data).split("\n\n")
          .map { |group_string| group_string.strip.split(/\n/) }
          .map { |group|
            group.map { |person| person.gsub(/\s/, "").chars.sort.to_set }
              .reduce { |a, b| a & b }
              .size
          }.sum
      end
    end
  end
end
