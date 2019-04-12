
require './lib/game'
RSpec.describe Game  do
	it "the game must be initialize with default value" do
		g = Game.new
		expect(g.b).to eql(nil)
	    expect(g.turn).to eql("x")
	    expect(g.score).to eql([0,0,0])
	end	
	describe "switch_turn" do
		it "should change the turn of player to o if the actual turn is x " do
			g = Game.new
			g.b = Board.new
			expect(g.switch_turn(g.turn)).to eql("o")
		end
		it "should change the turn of player to x if the actual turn is o " do
			g = Game.new
			g.b = Board.new
			g.turn = "o"
			expect(g.switch_turn(g.turn)).to eql("x")
		end
	end
end	
		
	
		
