require_relative 'board'
require_relative 'player'
require_relative 'views'

$p1 = 0
$p2 = 0
$b  = 0

  def say_msg_cond(turn,player1,player2,msg)
    puts turn == 0 ? "#{player1} #{msg}" : "#{player2} #{msg}"
  end    

  def switch_turn(turn)
    turn == 0 ? 1 : 0	
  end
    
  def switch_sym(turn,p1,p2)
    turn == 0 ?  p1.symbol : p2.symbol  
  end


	def play(player1,player2)
	      @turn   = 0 
        @symbol = $p1.symbol                     
        cond = false
      while !cond
            say_msg_cond(@turn,player1,player2," it's you turn")
            cell = get_input("Enter a number 0..8 or q to quit : ") 
            case
                when cell.upcase == "Q"
                    cond = true  
                    puts "Game over!"    
                when cell.to_i >= 0 && cell.to_i <=8
                	  if $b.change_mat(cell.to_i,@symbol)
                      $b.print_mat
                      if !$b.check_winner(@symbol) 
                        if !$b.draw?
                          @turn = switch_turn(@turn)
                          @symbol = switch_sym(@turn,$p1,$p2)
                        else
                          puts "its a draw" 
                          cond = true 
                        end                                
                      else 
                        say_msg_cond(@turn,$p1.name,$p2.name," You Win ")
                        @turn == 0 ? $p1.score +=1 : $p2.score +=1 
                        cond = true 
                      end 

                    end 
                	  
                end    	            
        end	
	end		


def new_game
  player1 = get_input("Name Player one : ").capitalize
  player2 = get_input("Name Player two : ").capitalize 
  
  $p1 = Player.new(player1,"x")
  $p2 = Player.new(player2,"o")
  $b  = Board.new(0)
  greeting(player1,player2,$p1.score,$p2.score)
  play(player1,player2)
end 
def  replay
   $b  = Board.new(0)
   if $p1 != 0 && $p2 != 0
      greeting($p1.name,$p2.name,$p1.score,$p2.score)
      play($p1.name,$p2.name)
   else
      puts "there is no player"   
   end   
end  

def scores
    if $p1 != 0 && $p2 != 0
      greeting($p1.name,$p2.name,$p1.score,$p2.score)
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