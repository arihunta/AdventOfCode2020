require "set"

module Arihunta
  module AdventOfCode2020
    class Day01
      def self._01(data)
        numbers = File.readlines(data).map { |line| Integer(line) }.to_set
        return solve(2020, numbers)
      end

      def self._02(data)
        numbers = File.readlines(data).map { |line| Integer(line) }
        new_numbers = numbers.to_set
        numbers.each do |num|
          new_target = 2020 - num
          new_numbers.delete(num)
          answer = solve(new_target, new_numbers)
          return num * answer if answer != nil
          new_numbers.add(num)
        end
      end

      def self.solve(target, numbers)
        numbers.each do |num|
          complement = target - num
          return num * complement if numbers.include?(complement)
        end
        nil
      end
    end
  end
end
