require './lib/board'
RSpec.describe Board  do
	describe "#initialize" do	
		context "when creating new instance of board" do
			it "should create moves players matrix with dimension dim x dim" do
				b = Board.new(3)
				expect(b.matrix).to be == Array.new(b.dim * b.dim)
				expect(b.matrix.all?{|i| i == nil}).to eql(true)
			end	
			it "should generate a win combinaisons matrix" do
				
				b = Board.new(3)
					expect(b.winCombin).to eql([[0,1,2],[3,4,5],[6,7,8],#Horizontal combinaisons
    											[0,3,6],[1,4,7],[2,5,8],#vertical combinaisons
    											[0,4,8],[2,4,6]])       # diagonal combinaisons
				b = Board.new(5)
				expect(b.winCombin).to eql([[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14], 
	  										[15, 16, 17, 18, 19], [20, 21, 22, 23, 24],#Horizontal combinaisons 
	  										[0, 5, 10, 15, 20], [1, 6, 11, 16, 21],[2, 7, 12, 17, 22],
	  										[3, 8, 13, 18, 23], [4, 9, 14, 19, 24],#vertical combinaisons
	  										[0, 6, 12, 18, 24], [4, 8, 12, 16, 20]])# diagonal combinaisons	
			end	

		end

	end

	describe "#change_mat" do
		context "" do
			it "return true if the cell is empty and change the matrix" do
				b = Board.new(3)
				expect(b.change_mat(0,"x")).to eql(true)
				expect(b.matrix).to eql(["x",nil,nil,nil,nil,nil,nil,nil,nil])
			end	
			it "return false if the cell is not empty and do not change the matrix" do
				b = Board.new(3)
				b.matrix=["o",nil,nil,nil,nil,nil,nil,nil,nil]
				expect(b.change_mat(0,"x")).to eql(false)
				expect(b.matrix).to eql(["o",nil,nil,nil,nil,nil,nil,nil,nil])
			end
		end	
			
	end	

	describe "#check_winner" do
		context "confirm the winner" do
			it "is player1 when:" do
				#combinaisons win with dimention 3
				b = Board.new(3)
				b.matrix = ["x","x","x",
							nil,nil,nil,
							nil,nil,nil]
				expect(b.check_winner("x")).to eql(true) 
				b.matrix = [nil,nil,nil,
							"x","x","x",
							nil,nil,nil]
				expect(b.check_winner("x")).to eql(true)
				b.matrix = [nil,nil,nil,
							nil,nil,nil,
							"x","x","x"]
				expect(b.check_winner("x")).to eql(true)
				b.matrix = ["x",nil,nil,
							nil,"x",nil,
							nil,nil,"x"]
				expect(b.check_winner("x")).to eql(true)
				b.matrix = [nil,nil,"x",
							nil,"x",nil,
							"x",nil,nil]
				expect(b.check_winner("x")).to eql(true)

				#combinaisons win with dimention 4
				b = Board.new(4)
				b.matrix = ["x","x","x","x",
							nil,nil,nil,nil,
							nil,nil,nil,nil,
							nil,nil,nil,nil]
				expect(b.check_winner("x")).to eql(true) 
				b.matrix = [nil,nil,nil,nil,
							"x","x","x","x",
							nil,nil,nil,nil,
							nil,nil,nil,nil]
				expect(b.check_winner("x")).to eql(true)
				b.matrix = [nil,nil,nil,nil,
							nil,nil,nil,nil,
							"x","x","x","x",
							nil,nil,nil,nil]
				expect(b.check_winner("x")).to eql(true)
				b.matrix = [nil,nil,nil,nil,
							nil,nil,nil,nil,
							nil,nil,nil,nil,
							"x","x","x","x"]
				expect(b.check_winner("x")).to eql(true)
				b.matrix = ["x",nil,nil,nil,
							nil,"x",nil,nil,
							nil,nil,"x",nil,
							nil,nil,nil,"x"]
				expect(b.check_winner("x")).to eql(true)
				b.matrix = [nil,nil,nil,"x",
							nil,nil,"x",nil,
							nil,"x",nil,nil,
							"x",nil,nil,nil]
				expect(b.check_winner("x")).to eql(true)
			end
		end	
			
		it "return false if the symbol of the player do not make one combinaison of win" do
			b = Board.new(3)
			b.matrix = ["x","x","o",
						"o","o",nil,
						nil,nil,nil]
			expect(b.check_winner("x")).to eql(false) 

		end

		describe "#draw" do
			context "confirm draw when" do
				it "no empty cell in the matrix" do
					b = Board.new(3)
					b.matrix = ["x","x","o",
								"o","o","x",
								"x","o","x"]
			expect(b.draw?).to eql(true)
				end	
			end	
		end	
	end	
end
