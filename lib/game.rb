require_relative 'board'
require_relative 'player'
require_relative 'views'
  

  class  Game

      attr_accessor :board, :turn, :player1, :player2
      def initialize
        @board   = nil
        @player1 = nil
        @player2 = nil
        @turn    = 0
      end
  end  

  def say_msg_cond(turn,player1,player2,msg)
    puts turn == 0 ? "#{player1} #{msg}" : "#{player2} #{msg}"
  end    

  def switch_turn(turn)
    turn == 0 ? 1 : 0	
  end
    
  def switch_sym(turn,p1,p2)
    turn == 0 ?  p1.symbol : p2.symbol  
  end

  def move?(cell)
    symb = switch_sym(@turn,@player1,@player2)
    if @board.change_mat(cell.to_i,symb)
      @board.print_board(@board.dim)
      if !@board.check_winner(symb) 
        if !@board.draw?
          @turn = switch_turn(@turn)
        else
          puts "its a draw" 
          return true 
        end                                
        else 
          say_msg_cond(@turn,@player1.name,@player2.name," You Win ")
          @turn == 0 ? @player1.score +=1 : @player2.score +=1 
          return true 
      end 
    end 
    return false
  end  

	def play
	      @turn   = 0                      
        cond = false
      while !cond
            say_msg_cond(@turn,@player1.name,@player2.name," it's you turn") 
            cell = get_input("Enter a number 0..#{@board.dim * @board.dim} or q to quit : ") 
            case
                when cell.upcase == "Q"
                    cond = true  
                    puts "Game over!"    
                when cell.to_i >= 0 && cell.to_i <= @board.dim*@board.dim
                	  cond = move?(cell)
                	  
                end    	            
        end	
	end		


def new_game
  dim = 0
  until dim >= 3 && dim <= 9 
      dim  = get_input("The Dimension   : ").to_i
  end  
  p1   = get_input("Name Player one : ").capitalize
  p2   = get_input("Name Player two : ").capitalize 
  
  game = Game.new
  @player1 = Player.new(p1,"x")
  @player2 = Player.new(p2,"o")
  @board  = Board.new(dim)
  
  @board.init_combin(dim)
  greeting(p1,p2,@player1.score,@player2.score)
  play
end 

def  replay
   @board  = Board.new(@board.dim)
   @board.init_combin(@board.dim)
   if @player1 != nil && @player2 != nil
      greeting(@player1.name,@player2.name,@player1.score,@player2.score)
      play
   else
      puts "there is no player"   
   end   
end  

def scores
    if @player1 != nil && @player2 != nil
      greeting(@player1.name,@player2.name,@player1.score,@player2.score)
   else
      puts "there is no player"   
   end
end  

ch = ""
cls
while ch != "Q"
    menu
    ch = get_input("Your Choice : ").upcase
    case
  when ch == "S"
     new_game
  when ch == "C"
     scores
  when ch == "R"
       replay 
  end 
end
puts "Good by!"