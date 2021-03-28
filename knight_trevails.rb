#make 8x8 board. connect verticies that represent a knight's movement (2 forward 1 up, in any direction)
#if knight is on [0,0], the bottom left of the board, it can go to [2,1] or [1,2]
#from [1,2] it can go to [0,0] || [2,0] || [0,4] || [3,1] || [3,3] || [2,4] 

#so it can change its value by [1,2] or [2,1], as long as the board space is valid
# +2 +1, +2 -1, -2 +1, -2 -1, 
#+1 +2, +1 -2, -1 +2, -1 -2

class ChessBoard
    @@x_axis = [0,1,2,3,4,5,6,7]
    @@y_axis = [0,1,2,3,4,5,6,7]
    def initialize
        
    end
    def legal_move(arr)
        arr.sort!
        if arr[arr.length - 1] > 8
            return nil
        elsif arr[0] < 0
            return nil
        end
    true
    end
end
class Knight < ChessBoard
    @@starting_position = [0,0]
    def initialize(current_position = @@starting_position)
        @current_position = current_position
    end
    def current_position
        @current_position
    end
    def reset_position
        @current_position = @@starting_position
    end

    def move_plus2_plus1(position = @current_position)
        if legal_move([@current_position[0] + 2, @current_position[1] + 1])
        @current_position[0] += 2 
        @current_position[1] += 1 
        end
        @current_position
    end
    def move_plus2_minus1(position = @current_position)
        if legal_move([@current_position[0] + 2, @current_position[1] - 1])
        @current_position[0] += 2 
        @current_position[1] -= 1 
        end
        @current_position
    end
    def move_minus2_plus1(position = @current_position)
        if legal_move([@current_position[0] - 2, @current_position[1] + 1])
        @current_position[0] -= 2 
        @current_position[1] += 1 
        end
        @current_position
    end
    def move_minus2_minus1(position = @current_position)
        if legal_move([@current_position[0] - 2, @current_position[1] - 1])
        @current_position[0] -= 2 
        @current_position[1] -= 1 
        end
        @current_position
    end
    def move_plus1_plus2(position = @current_position)
        if legal_move([@current_position[0] + 1, @current_position[1] + 2])
        @current_position[0] += 1 
        @current_position[1] += 2 
        end
        @current_position
    end
    def move_plus1_minus2(position = @current_position)
        if legal_move([@current_position[0] + 1, @current_position[1] - 2])
        @current_position[0] += 1 
        @current_position[1] -= 2 
        end
        @current_position
    end
    def move_minus1_plus2(position = @current_position)
        if legal_move([@current_position[0] - 1, @current_position[1] + 2])
        @current_position[0] -= 1 
        @current_position[1] += 2 
        end
        @current_position
    end
    def move_minus1_minus2(position = @current_position)
        if legal_move([@current_position[0] - 1, @current_position[1] - 2])
        @current_position[0] -= 1 
        @current_position[1] -= 2 
        end
        @current_position
    end
    


    
end
board = ChessBoard.new
knight = Knight.new
#Treat all possible moves the knight could make as children in a tree.
# Don’t allow any moves to go off the board.
#print knight.current_position
print knight.move_minus1_minus2