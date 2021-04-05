# +2 +1, +2 -1, -2 +1, -2 -1, 
#+1 +2, +1 -2, -1 +2, -1 -2

#current problem is line 125
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
    @@starting_position = [0,0].freeze
    
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
    def legal_moves(position = @@starting_position)
        moves = []
        moves << self.move_plus2_plus1(position)
        moves << self.move_plus2_minus1(position)
        moves << self.move_minus2_plus1(position)
        moves << self.move_minus2_minus1(position)
        moves << self.move_plus1_plus2(position)
        moves << self.move_plus1_minus2(position)
        moves << self.move_minus1_plus2(position)
        moves << self.move_minus1_minus2(position)
        legal_moves = moves.select do |move|
            move if move.is_a?(Array)
           end
        legal_moves            
    end
    def weigh(goal = [7,7]) 
        #call this method at start of knight travails method using current position, goal
        @tiles = {goal => 0} 
        @weight = 1 
        @weight_watcher = []
        @level = [goal] 
        while @tiles.length < 64           
            if @tiles.length <= 1
                legal = legal_moves(@level[0])
                moves1 = legal.select do |move|
                    move unless @tiles.include? move
                    end
                    @weight_watcher << moves1[-1]
                end
                moves2 = []
                moves1.each do |move|
                    legal_moves = self.legal_moves(move)
                    legal_moves.each do |move2|
                        moves2 << move2 unless @tiles.include? move2
                    end
                end
                @weight_watcher << moves2[-1]
                moves1.each do |move|
                    @tiles[move] = @weight
                end
                @weight_watcher.each do |move|
                    if @tiles.include? move
                         @weight += 1
                        @weight_watcher.delete(move)
                    end 
                end
                moves1 = moves2
        end
        
     
    end
    def check_tiles
        @tiles
    end
end
    

board = ChessBoard.new
knight = Knight.new
knight.weigh
print knight.check_tiles