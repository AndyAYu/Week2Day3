require_relative 'game.rb'

class Human_player

    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value

    end

    def get_position
        puts "Player #{mark.to_s}Enter your position(two numbers)(row,col) as 2 numbers with a space in between them"
        nums = '0123456789'
        position = gets.chomp
        arr = []
        position.split.each_with_index do |int,idx|
            if !nums.include?(int) || idx > 2 
                raise invalid position
            end
            arr << int.to_i
        end
        if arr.length > 2 
            raise 'sorry that was invalid :('
        end
        arr
    end

end