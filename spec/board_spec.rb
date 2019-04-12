require './lib/board'
RSpec.describe Board  do

	it "the board must be initialize to default value if no value is specified" do
		b = Board.new
		expect(b.dim).to eql(3)
	    expect(b.matrix).to be == Array.new(9)
	    expect(b.winCombin).to eql([[0,1,2],[3,4,5],[6,7,8],
    		[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]])
	end	

	it "initialize the board with parameters" do 
	  b = Board.new(5)
	  expect(b.dim).to eql(5)
	  expect(b.matrix).to be == Array.new(b.dim*b.dim)
	  expect(b.winCombin).to eql([[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14], 
	  	[15, 16, 17, 18, 19], [20, 21, 22, 23, 24], [0, 5, 10, 15, 20], [1, 6, 11, 16, 21],
	  	[2, 7, 12, 17, 22], [3, 8, 13, 18, 23], [4, 9, 14, 19, 24], [0, 6, 12, 18, 24], [4, 8, 12, 16, 20]])	
	end	
	
	describe "change_mat" do
		it "return true if the cell is empty and change the matrix" do
			b = Board.new
			expect(b.change_mat(0,"x")).to eql(true)
		end	
		it "return false if the cell is not empty" do
			b = Board.new
			b.matrix=["o",nil,nil,nil,nil,nil,nil,nil,nil]
			expect(b.change_mat(0,"x")).to eql(false)
		end	
	end	
	
	describe "check_winner(symbol)" do
		it "return true if the symbol of the player make one combinaison of win" do
			b = Board.new
			b.matrix = ["x","x","x","o","o",nil,nil,nil,nil]
			expect(b.check_winner("x")).to eql(true) 

		end	
		it "return false if the symbol of the player do not make one combinaison of win" do
			b = Board.new
			b.matrix = ["x","x","o","o","o",nil,nil,nil,nil]
			expect(b.check_winner("x")).to eql(false) 

		end
	end	
	describe "draw?" do
		it " return true if there is no empty cell in the matrix" do
			b = Board.new
			b.matrix = ["x","o","o","o","x","x","o","x","o"]
			expect(b.draw?).to eql(true)
		end	
	end	
	
end