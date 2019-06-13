    class Game 
    attr_accessor  :score , :board , :turn,  :size_board
    def initialize(size_board)
      @size_board = size_board  
      @turn = 'x'
      @board = Board.new(size_board) #nil
      @score  = [0,0,0] # cell1 the number player1 win, cell2 player2 win , cell3 number draw
    end 
    def switch_turn(turn)
        turn == "x" ? "o" : "x"   
    end  
  end  

