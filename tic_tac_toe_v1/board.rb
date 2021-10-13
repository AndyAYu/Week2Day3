class Board

    attr_reader :grid


    def initialize
        @grid = Array.new(3) { Array.new(3, "_")}
    end

    def valid?(position)
        position.all? { |num| num < 3 && num >= 0 }
    end

    def empty?(position)
        a,b = position
        @grid[a][b] == "_"
    end

    def place_mark(position, mark)
        a,b = position
        if valid?(position) && empty?(position)
            @grid[a][b] = mark
        elsif !valid?(position) || !empty?(position)
            raise 'invalid mark'
        end
    end

    def print
        @grid.each do |row|
            p row
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all?(mark)
                return true
            end
        end
        false
    end

    def win_col?(mark)
        cols = @grid.transpose
        cols.each do |col| 
            return true if col.all?(mark) 
        end
        false
    end

    def win_diagonal?(mark)
        (0...@grid.length).all? { |i| (@grid[i][i] == mark) && (@grid[i][(i-2) * -1] == mark)}
    end

    def win?(mark)
        return true if win_diagonal?(mark) || win_col?(mark) || win_row?(mark) 
    end

    def empty_positions?
        @grid.any? { |row| row.any? { |ele| ele == "_" }}
    end

end

# Board#empty?(position)
# This method should return a boolean indicating whether or not the specified position does not contain a player's mark.

# Board#place_mark(position, mark)
# This method should assign the given mark to the specified position of the grid. It should raise an error when the position is not #valid? or not #empty?.