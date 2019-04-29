require_relative 'game'
require_relative 'board'

def cls
  system('cls')
  system "clear"
end

def get_input(msg)
    print msg 
	output = gets.chomp
end	

def score(player1,player2,score_p1,score_p2,nb_draw)
	    cls
	    2.times { print "\n"}
	    print "\n"
        puts "         #{player1} Score = #{score_p1}   #{player2} Score = #{score_p2} Draw = #{nb_draw}"
        print "\n"
end	

def menu
		puts '________________________ Menu ____________________________'
		print "\n"
		puts '                        S.Start                       '
		puts '                        Q.Quit                        '
		puts '                        R.Replay                      '
		puts '                        C.Scores                      '
		puts '__________________________________________________________'
        print "\n"
end
def print_winner(game,dim,turn)
	game.board.print_board(dim)
    puts "Player#{turn} you won !"
    game.score[turn.to_i  - 1] += 1
end	
def new_game(game) 
  while true do
  	dim = game.size_board
    game.board.print_board(dim)
    t = game.turn == "x" ? "1" : "2"   
    puts "Player#{t} choose a number in 0 - #{dim*dim -1}  or Q to quit!"   
    cell = gets.chomp
    if cell.upcase == "Q"
       puts "Quit"
       break
    elsif game.board.change_mat(cell.to_i,game.turn)
        if game.board.check_winner(game.turn)
          print_winner(game,dim,t)
          break
        elsif game.board.draw? 
          game.board.print_board(dim)	
          puts "its a draw"
          game.score[2] += 1
          break
        end 
        game.turn = game.switch_turn(game.turn)      
    end     
  end   
end  
#===================================================================================
ch = ""
cls
while ch != "Q"
    menu
    ch = get_input("Your Choice : ").upcase
    case
      when ch == "S"  
        size = 0     
        size = get_input("Enter the size of the board in [3..10]: ") until size.to_i >=3 && size.to_i <= 10      
        game   = Game.new(size.to_i)
        new_game(game)
      when ch == "C"
        if game != nil
         score("player1","player2",game.score[0],game.score[1],game.score[2])
        else
         score("player1","player2",0,0)
        end 
      when ch == "R"
          if game != nil 
            game.board.matrix  = Array.new(game.size_board*game.size_board)
            new_game(game)
          end  
    end 
end
puts "Good by!"