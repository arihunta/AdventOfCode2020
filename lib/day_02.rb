require "set"
require "pry"

module Arihunta
  module AdventOfCode2020
    class Day02
      RulePattern = /(\d+)-(\d+) (.): (.+)/
      def self._01(data)
        File.readlines(data).map { |line|
          line.match(RulePattern)
        }.select { |match_data|
          match_data != nil
        }.select { |match_data|
          lower_limit = Integer(match_data[1])
          upper_limit = Integer(match_data[2])
          character = match_data[3]
          password = match_data[4].gsub(/[^#{character}]/, "").strip
          password.size >= lower_limit && password.size <= upper_limit
        }.size
      end

      def self._02(data)
        File.readlines(data).map { |line|
          line.match(RulePattern)
        }.select { |match_data|
          match_data != nil
        }.select { |match_data|
          lower_index = Integer(match_data[1]) - 1
          upper_index = Integer(match_data[2]) - 1
          character = match_data[3]
          password = match_data[4]
          (password[lower_index] == character && password[upper_index] != character) || 
          (password[lower_index] != character && password[upper_index] == character)
        }.size
      end
    end
  end
end
