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

def score(player1,player2,score_p1,score_p2)
	    cls
	    2.times { print "\n"}
	    print "\n"
        puts "           Welcome #{player1} and #{player2} "
        puts "         #{player1} Score = #{score_p1}   #{player2} Score = #{score_p2}"
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

def new_game(g) 
  while true do
    g.b.print_board(g.b.dim)
    t = g.turn == "x" ? "1" : "2"
    puts "Player#{t} choose a number in 0 - #{g.b.dim*g.b.dim - 1} or Q to quit!"   
    cell = gets.chomp
    if cell.upcase == "Q"
       puts "Quit"
       break
    elsif g.b.change_mat(cell.to_i,g.turn)
        if g.b.check_winner(g.turn)
          g.b.print_board(g.b.dim)
          puts "Player#{t} you won !"
          g.score[t.to_i  - 1] += 1
          break
        elsif g.b.draw? 
          puts "its a draw"
          break
        end 
        g.turn = g.switch_turn(g.turn)      
    end     
  end   
end  

ch = ""
cls
while ch != "Q"
    menu
    ch = get_input("Your Choice : ").upcase
    case
      when ch == "S"        
        g   = Game.new
        g.b = Board.new
        new_game(g)
      when ch == "C"
        if g != nil
         score("player1","player2",g.score[0],g.score[1])
        else
         score("player1","player2",0,0)
        end 
      when ch == "R"
          if g != nil 
            g.b.matrix  = Array.new(g.b.dim*g.b.dim) 
            new_game(g)
          end  
    end 
end
puts "Good by!"