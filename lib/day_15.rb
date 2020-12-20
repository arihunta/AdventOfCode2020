module Arihunta
  module AdventOfCode2020
    class Day15
      def self._01(data)
        history = Hash.new
        numbers = File.read(data).strip.split(',')
          .map { |x| x.to_i }
        turn = numbers.size + 1
        lastnum = numbers.last
        numbers.pop
        numbers.each_with_index { |x, i| history[x] = i + 1 }
        while turn <= 2020 do
          if history.has_key?(lastnum)
            nextnum = turn - history[lastnum] - 1
          else
            nextnum = 0
          end
          history[lastnum] = turn - 1
          lastnum = nextnum
          turn += 1
        end
        lastnum
      end

      def self._02(data)
        history = Hash.new
        numbers = File.read(data).strip.split(',')
          .map { |x| x.to_i }
        turn = numbers.size + 1
        lastnum = numbers.last
        numbers.pop
        numbers.each_with_index { |x, i| history[x] = i + 1 }
        while turn <= 30000000 do
          if history.has_key?(lastnum)
            nextnum = turn - history[lastnum] - 1
          else
            nextnum = 0
          end
          history[lastnum] = turn - 1
          lastnum = nextnum
          turn += 1
        end
        lastnum
      end
    end
  end
end
