class TicTacToe
attr_accessor :board

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] 

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(input)
        @index = input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end 

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(position)
        if @board[position] == " "
            true
        else
            false
        end
    end 
    
    def turn_count
        counter = 0
        @board.each do |space|
            if space == "X" || space == "O"
                counter += 1
            end
        end
        counter
    end 

    def current_player
    turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Enter 1-9"
        input = gets
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each {|combo|
        spot1 = combo[0]
        spot2 = combo[1]
        spot3 = combo[2]
    
        position1 = board[spot1]
        position2 = board[spot2]
        position3 = board[spot3]
    
        if position1 == "X" && position2 == "X" && position3 == "X"
          return combo
        elsif position1 == "O" && position2 == "O" && position3 == "O"
          return combo
        end
      }
      return false
    end

    def full?
       board.all? {|position| position == "X" || position == "O"}
    end

    def draw?
        
    end

end