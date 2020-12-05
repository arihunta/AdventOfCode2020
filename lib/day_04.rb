require "set"
require "pry"

module Arihunta
  module AdventOfCode2020
    class Day04
      RequiredFields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"].to_set

      ValidEyeColours = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].to_set

      def self._01(data)
        File.read(data).split("\n\n")
          .map { |data| data.strip }
          .select { |data| data.size > 0 }
          .map { |passport_string| passport_string.split(/[\s]/).map { |entry| entry.split(":") }.to_h }
          .select { |passport| RequiredFields.subset?(passport.keys.to_set) }
          .size
      end

      def self._02(data)
        File.read(data).split("\n\n")
          .map { |data| data.strip }
          .select { |data| data.size > 0 }
          .map { |passport_string| passport_string.split(/[\s]/).map { |entry| entry.split(":") }.to_h }
          .select { |passport| RequiredFields.subset?(passport.keys.to_set) }
          .select { |passport|
          passport["byr"] = Integer(passport["byr"])
          passport["byr"] >= 1920 && passport["byr"] <= 2002
        }.select { |passport|
          passport["iyr"] = Integer(passport["iyr"])
          passport["iyr"] >= 2010 && passport["iyr"] <= 2020
        }.select { |passport|
          passport["eyr"] = Integer(passport["eyr"])
          passport["eyr"] >= 2020 && passport["eyr"] <= 2030
        }.select { |passport|
          match = passport["hgt"].match(/(\d+)(in|cm)/)
          if match
            height = Integer(match[1])
            if match[2] == "cm"
              height >= 150 && height <= 193
            else
              height >= 59 && height <= 76
            end
          else
            false
          end
        }.select { |passport|
          passport["hcl"].match(/#[0-9a-f]{6}/)
        }.select { |passport|
          ValidEyeColours.include?(passport["ecl"])
        }.select { |passport|
          passport["pid"].match(/^[0-9]{9}$/)
        }.size
      end
    end
  end
end
