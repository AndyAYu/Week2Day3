class Player


    def get_move
        puts "enter a position with coordinates separtated with a space like '4 7'"
        array = []
        position = gets.chomp
        position.split.each do |ele|
            array << ele.to_i
        end
        array
    end

end
