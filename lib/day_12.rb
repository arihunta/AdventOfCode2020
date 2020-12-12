module Arihunta
  module AdventOfCode2020
    class Day12
      East = [1, 0]
      North = [0, 1]
      West = [-1, 0]
      South = [0, -1]
      Headings = [East, North, West, South]
      def self._01(data)
        instructions = File.readlines(data).map { |line| [line[0], line[1..(line.length)].strip.to_i] }
        heading = 0
        coords = [0, 0]
        instructions.each { |cmd|
          case cmd[0]
          when "E"
            coords = advance(coords, East, cmd[1])
          when "N"
            coords = advance(coords, North, cmd[1])
          when "W"
            coords = advance(coords, West, cmd[1])
          when "S"
            coords = advance(coords, South, cmd[1])
          when "F"
            coords = advance(coords, Headings[heading], cmd[1])
          when "L", "R"
            heading = turn(cmd, heading)
          end
        }
        coords[0].abs + coords[1].abs
      end

      def self._02(data)
        instructions = File.readlines(data).map { |line| [line[0], line[1..(line.length)].strip.to_i] }
        waypoint = [10, 1]
        coords = [0, 0]
        instructions.each { |cmd|
          case cmd[0]
          when "E"
            waypoint = advance(waypoint, East, cmd[1])
          when "N"
            waypoint = advance(waypoint, North, cmd[1])
          when "W"
            waypoint = advance(waypoint, West, cmd[1])
          when "S"
            waypoint = advance(waypoint, South, cmd[1])
          when "F"
            coords = advance(coords, waypoint, cmd[1])
          when "L", "R"
            waypoint = rotate(waypoint, cmd)
          end
        }
        coords[0].abs + coords[1].abs
      end

      def self.turn(cmd, heading)
        if cmd[0] == "L"
          (heading + (cmd[1] / 90)) % 4
        else
          (heading + (cmd[1] / -90)) % 4
        end
      end

      def self.advance(coords, heading, amt)
        [coords[0] + heading[0] * amt, coords[1] + heading[1] * amt]
      end

      def self.rotate(vector, cmd)
        angle = (cmd[0] == "L") ? (cmd[1] % 360) : (360 - (cmd[1] % 360))
        case angle
        when 0
          [vector[0], vector[1]]
        when 90
          [-vector[1], vector[0]]
        when 180
          [-vector[0], -vector[1]]
        when 270
          [vector[1], -vector[0]]
        end
      end
    end
  end
end
