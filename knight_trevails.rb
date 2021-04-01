# +2 +1, +2 -1, -2 +1, -2 -1, 
#+1 +2, +1 -2, -1 +2, -1 -2

#current problem is line 138
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
    def weigh(goal = [7,7], position = @@starting_position, reset = nil) 
        #call this method at start of knight travails method using current position, goal, and 1(reset)
        @tiles = {} unless @tiles 
        @weight = 1 unless @weight
        @weight_increase = [] unless @weight_increase
        @queue = [goal] unless @queue
        @tiles = {} if reset 
        @weight = 1 if reset
        @queue = [goal] if reset
        @weight_increase [] if reset
        @tiles[goal] = 0 if @tiles.empty?
        unless @queue.empty?
            legal_moves = self.legal_moves(@queue[0]) #an array of goal's children
            unchecked = [] 
            legal_moves.each do |move|
                unless @tiles.include?(move)
                    @tiles[move] = @weight
                    @queue << move
                    unchecked << move
                end
            end 
            @weight_increase << unchecked[-1]
        @weight += 1 if @weight_increase.include? @queue.shift 
        self.weigh(@queue[0])
        #@weight is increasing too quickly. go through process slowly and figure out where error in logic is. 
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