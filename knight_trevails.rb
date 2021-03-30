# +2 +1, +2 -1, -2 +1, -2 -1, 
#+1 +2, +1 -2, -1 +2, -1 -2

#so now i need to figure out how to use the moves sequentially to reach a certain position
#from current position (root), I need to make the legal moves its children, then make those children's
#legal moves children. Then I search through the tree (BFS?) until I find the correct coordinates.
#I may need to swap legal move check from the move methods to the tree method?
class ChessBoard


    def initialize
        
    end
    def legal_move(arr)
        if arr[0] >= 8 || arr[1] >= 8
            return nil
        elsif arr[0] < 0 || arr[1] < 0
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

    def move_plus2_plus1(position = @@starting_position)
        if legal_move([position[0] + 2, position[1] + 1])
        new_position = [position[0] + 2]
        new_position << position[1] + 1
        else
           return nil
        end
        
    end
    def move_plus2_minus1(position = @@starting_position)
        if legal_move([position[0] + 2, position[1] - 1])
        new_position = [position[0] + 2]
        new_position << position[1] - 1 
        else
           return nil
        end    
    end
    
    def move_minus2_plus1(position = @@starting_position)
        if legal_move([position[0] - 2, position[1] + 1])
            new_position = [position[0] - 2]
            new_position << position[1] + 1 
        else
           return nil
        end
        
    end
    def move_minus2_minus1(position = @@starting_position)
        if legal_move([position[0] - 2, position[1] - 1])
            new_position = [position[0] - 2]
            new_position << position[1] - 1 
        else
           return nil
        end
    end
    def move_plus1_plus2(position = @@starting_position)
        if legal_move([position[0] + 1, position[1] + 2])
            new_position = [position[0] + 1]
            new_position << position[1] + 2 
        else 
            return nil
        end
    end
    def move_plus1_minus2(position = @@starting_position)
        if legal_move([position[0] + 1, position[1] - 2])
            new_position = [position[0] + 1]
            new_position << position[1] - 2 
        else 
           return nil
        end
    end
    def move_minus1_plus2(position = @@starting_position)
        if legal_move([position[0] - 1, position[1] + 2])
            new_position = [position[0] - 1]
            new_position << position[1] + 2 
        else
           return nil
        end
    end
    def move_minus1_minus2(position = @@starting_position)
        if legal_move([position[0] - 1, position[1] - 2])
            new_position = [position[0] - 1]
            new_position << position[1] - 2 
        else 
           return nil
        end
    end
    def tree_path(current = @@starting_position)
#if move...(current) hmmmm... how do I store the moves? a non-instanced array variable?
#I want all legal moves to be children of my current position
#How do I store this, how will I use the list of legal moves?
#if I add each legal move to the array, then recursively call the function on each member of the array
#in theory I should have every legal move, right? lets try it out
        legal_moves = []
        if self.move_plus2_plus1
            legal_moves << self.move_plus2_plus1
        end
        if self.move_plus2_minus1
            legal_moves << self.move_plus2_minus1
        end
        if self.move_minus2_plus1
            legal_moves << self.move_minus2_plus1
        end
        if self.move_minus2_minus1
            legal_moves << self.move_minus2_minus1
        end
        if self.move_plus1_plus2
            legal_moves << self.move_plus1_plus2
        end
        if self.move_plus1_minus2
            legal_moves << self.move_plus1_minus2
        end
        if self.move_minus1_plus2
            legal_moves << self.move_minus1_plus2
        end
        if self.move_minus1_minus2
            legal_moves << self.move_minus1_minus2
        end
    end
    

    
end
board = ChessBoard.new
knight = Knight.new
puts knight.move_plus2_plus1
puts knight.move_plus1_plus2