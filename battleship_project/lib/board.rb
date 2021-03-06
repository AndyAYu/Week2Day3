class Board

    attr_reader :size

    def initialize(n)

        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n 
        

    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def [](position)
    a,b = position #[a,b]
    @grid[a][b]  
    end

    def []=(position, v)
        a,b = position #[a,b]
        @grid[a][b] = v
    end


    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self.[]=(position,:X)
            return false
        end
    end

    def place_random_ships
        quarter = @size / 4
        while num_ships < quarter
            a = rand(0...@grid.length)
            b = rand(0...@grid.length)
            position = [a,b]
            self[position] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
