def cls
  system('cls')
  system "clear"
end

def get_input(msg)
    print msg 
	output = gets.chomp
end	

def greeting(player1,player2,score_p1,score_p2)
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