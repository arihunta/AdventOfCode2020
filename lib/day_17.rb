require "set"

module Arihunta
  module AdventOfCode2020
    class Day17
      NeighbourDeltas = [[-1, -1, -1],
              [-1, -1, 0],
              [-1, -1, 1],
              [-1, 0, -1],
              [-1, 0, 0],
              [-1, 0, 1],
              [-1, 1, -1],
              [-1, 1, 0],
              [-1, 1, 1],
              [0, -1, -1],
              [0, -1, 0],
              [0, -1, 1],
              [0, 0, -1],
              [0, 0, 1],
              [0, 1, -1],
              [0, 1, 0],
              [0, 1, 1],
              [1, -1, -1],
              [1, -1, 0],
              [1, -1, 1],
              [1, 0, -1],
              [1, 0, 0],
              [1, 0, 1],
              [1, 1, -1],
              [1, 1, 0],
              [1, 1, 1]]

      def self._01(data)
        active_cubes = Set.new
        File.readlines(data).each_with_index { |line, y|
          line.strip.chars.each_with_index { |char, x|
            active_cubes << [x, y, 0] if char == "#"
          }
        }

        for i in 1..6
          new_active = Set.new
          active_cubes.map { |coord| neighbours(coord) + [coord] }
            .flatten(1)
            .uniq
            .each { |candidate|
              num_active_neighbours = neighbours(candidate).select{ |neighbour| active_cubes.include?(neighbour) }.size
              if active_cubes.include?(candidate)
                new_active << candidate if num_active_neighbours == 2 || num_active_neighbours == 3 
              else
                new_active << candidate if num_active_neighbours == 3
              end
            }
          active_cubes = new_active
        end

        active_cubes.size
      end

      def self._02(data)
        active_cubes = Set.new
        File.readlines(data).each_with_index { |line, y|
          line.strip.chars.each_with_index { |char, x|
            active_cubes << [x, y, 0, 0] if char == "#"
          }
        }

        for i in 1..6
          new_active = Set.new
          active_cubes.map { |coord| hypercube_neighbours(coord) + [coord] }
            .flatten(1)
            .uniq
            .each { |candidate|
              num_active_neighbours = hypercube_neighbours(candidate).select{ |neighbour| active_cubes.include?(neighbour) }.size
              if active_cubes.include?(candidate)
                new_active << candidate if num_active_neighbours == 2 || num_active_neighbours == 3 
              else
                new_active << candidate if num_active_neighbours == 3
              end
            }
          active_cubes = new_active
        end

        active_cubes.size
      end

      def self.neighbours(coord)
        NeighbourDeltas.map { |delta| [coord[0] + delta[0], coord[1] + delta[1], coord[2] + delta[2]] }
      end

      def self.hypercube_neighbours(coord)
        NeighbourDeltas.map { |delta| [coord[0] + delta[0], coord[1] + delta[1], coord[2] + delta[2]] }
          .map { |neighbour_3d|
            (-1..1).map { |delta_w|
              [neighbour_3d[0], neighbour_3d[1], neighbour_3d[2], coord[3] + delta_w]
            }
          }.flatten(1) + [[coord[0], coord[1], coord[2], coord[3] - 1], [coord[0], coord[1], coord[2], coord[3] + 1]]
      end
    end
  end
end
