module Arihunta
  module AdventOfCode2020
    class Day11
      Directions = [[-1, -1], [0, -1], [1, -1], [-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1]]

      @@sight_lines_cache = Hash.new

      def self._01(data)
        seats = File.readlines(data).map { |line| [".", line.strip.chars, "."].flatten }
        seats.push(Array.new(seats[0].size) { "." })
        seats.unshift(Array.new(seats[0].size) { "." })
        has_changed = true
        seat_count = 0
        while has_changed
          has_changed = false
          tmp = Marshal.load(Marshal.dump(seats))
          for i in 1..(seats.size - 2)
            for j in 1..(seats[i].size - 2)
              if seats[i][j] == "#"
                if neighbours([i, j]).reject { |coord| seats[coord[0]][coord[1]] != "#" }.size >= 4
                  tmp[i][j] = "L"
                  has_changed = true
                  seat_count = seat_count - 1
                end
              elsif seats[i][j] == "L"
                if !neighbours([i, j]).any? { |coord| seats[coord[0]][coord[1]] == "#" }
                  tmp[i][j] = "#"
                  has_changed = true
                  seat_count = seat_count + 1
                end
              end
            end
          end
          seats = tmp
        end
        seat_count
      end

      def self._02(data)
        @@sight_lines_cache.clear
        seats = File.readlines(data).map { |line| [" ", line.strip.chars, " "].flatten }
        seats.push(Array.new(seats[0].size) { " " })
        seats.unshift(Array.new(seats[0].size) { " " })
        has_changed = true
        seat_count = 0
        while has_changed
          has_changed = false
          tmp = Marshal.load(Marshal.dump(seats))
          for i in 1..(seats.size - 2)
            for j in 1..(seats[i].size - 2)
              if seats[i][j] == "#"
                if sight_lines([i, j], seats).reject { |coord| seats[coord[0]][coord[1]] != "#" }.size >= 5
                  tmp[i][j] = "L"
                  has_changed = true
                  seat_count = seat_count - 1
                end
              elsif seats[i][j] == "L"
                if !sight_lines([i, j], seats).any? { |coord| seats[coord[0]][coord[1]] == "#" }
                  tmp[i][j] = "#"
                  has_changed = true
                  seat_count = seat_count + 1
                end
              end
            end
          end
          seats = tmp
        end
        seat_count
      end

      def self.printseats(seats)
        puts ""
        seats.each { |row| puts row.join }
        puts ""
      end

      def self.neighbours(coord)
        [
          [coord[0] - 1, coord[1] - 1],
          [coord[0], coord[1] - 1],
          [coord[0] + 1, coord[1] - 1],
          [coord[0] - 1, coord[1]],
          [coord[0] + 1, coord[1]],
          [coord[0] - 1, coord[1] + 1],
          [coord[0], coord[1] + 1],
          [coord[0] + 1, coord[1] + 1],
        ]
      end

      def self.sight_lines(coords, grid)
        if @@sight_lines_cache.has_key?(coords)
          return @@sight_lines_cache[coords]
        end
        sight_lines = Directions.map { |direction|
          neighbour = add_vectors(coords, direction)
          while grid[neighbour[0]][neighbour[1]] == "."
            neighbour = add_vectors(neighbour, direction)
          end
          grid[neighbour[0]][neighbour[1]] == " " ? nil : neighbour
        }.reject { |neighbour| neighbour == nil }
        @@sight_lines_cache[coords] = sight_lines
      end

      def self.add_vectors(a, b)
        [a[0] + b[0], a[1] + b[1]]
      end
    end
  end
end
