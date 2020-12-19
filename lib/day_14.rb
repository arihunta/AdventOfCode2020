module Arihunta
  module AdventOfCode2020
    class Day14
      InstructionPattern = /mem\[(\d+)\] = (\d+)/

      def self._01(data)
        memory = Hash.new
        mask = ""
        File.readlines(data).each { |instruction|
          if instruction.start_with?("mask = ")
            mask = instruction.slice(7, 36)
          else
            match = instruction.match(InstructionPattern)
            idx = match[1].to_i
            value = match[2].to_i
              .to_s(2)
              .rjust(36, "0")
            masked = (0..35).map { |i| mask[i] != "X" ? mask[i] : value[i] }.join.to_i(2)
            memory[idx] = masked
          end
        }
        memory.values.sum
      end

      def self._02(data)
        memory = Hash.new
        masks = []
        mask_and = 0
        File.readlines(data).each { |instruction|
          if instruction.start_with?("mask = ")
            mask_and = instruction.slice(7, 36).strip.gsub("0", "1").gsub("X", "0").to_i(2)
            masks = [instruction.slice(7, 36).strip]
            (0..35).each { |idx|
              tmp = []
              while !masks.empty?
                mask = masks.pop
                if mask[idx] == "X"
                  mask[idx] = "0"
                  tmp.push(mask.clone)
                  mask[idx] = "1"
                  tmp.push(mask.clone)
                else
                  tmp.push(mask)
                end
              end
              masks = tmp
            }
            masks = masks.map { |mask| mask.to_i(2) }
          else
            match = instruction.match(InstructionPattern)
            idx = match[1].to_i
            value = match[2].to_i
            masks.each { |mask|
              memory[(idx & mask_and) | mask] = value
            }
          end
        }
        memory.values.sum
      end
    end
  end
end
