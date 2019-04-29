
require './lib/game'
RSpec.describe Game  do
    describe "#initialize" do
    	context "when start a new game" do
    		it "create a new board with dimension = 3 if 3 is in argument" do
    			game = Game.new(3)
    			expect(game.size_board).to eql(3)
    		end
    		it "create a new board with dimension= 5 if 5 is in argument" do
    			game = Game.new(5)
    			expect(game.size_board).to eql(5)
    			expect(game.board).to be_instance_of(Board)
    		end
    		it "create the turn with symbol x to the player 1" do
    			game = Game.new(3)
    			expect(game.turn).to eql('x')
    		end	
    			
    		it "create an array where cell1 the number player1 win, cell2 player2 win , cell3 number draw" do
    			game = Game.new(5)
    			expect(game.score).to eql([0,0,0])
    		end		
    	end	
    end	
    describe "#switch_turn" do
		context "when switch turn" do
			it "should change the turn of player to o if the actual turn is x " do
			g = Game.new(3)
			#g.b = Board.new
			expect(g.switch_turn(g.turn)).to eql("o")
			end
		
			it "should change the turn of player to x if the actual turn is o " do
			g = Game.new(3)
			#g.b = Board.new
			g.turn = "o"
			expect(g.switch_turn(g.turn)).to eql("x")
			end
		end	
	end	
		
	
end	
		
	
		
