require "set"

module Arihunta
  module AdventOfCode2020
    class Day05
      def self._01(data)
        File.readlines(data)
          .map { |line| line.gsub(/[FBLR]/, "F" => "0", "B" => "1", "L" => "0", "R" => "1") }
          .map { |line| line.to_i(2) }
          .max
      end

      def self._02(data)
        seat_list = File.readlines(data)
          .map { |line| line.gsub(/[FBLR]/, "F" => "0", "B" => "1", "L" => "0", "R" => "1") }
          .map { |line| line.to_i(2) }
          .sort
        (Array(seat_list.first..seat_list.last).to_set - seat_list.to_set).first
      end
    end
  end
end
