class Board
	attr_accessor :matrix, :winCombin
	def initialize(turn)
		@matrix    = ["","","","","","","","",""]
		@winCombin = [[0,1,2],[3,4,5],[6,7,8],
	                 [0,3,6],[1,4,7],[2,5,8],
	                 [0,4,8],[2,4,6]] 
        turn = @turn                        
	end

	def change_mat(index, symbol)
        if @matrix[index] == ""
                @matrix[index] = symbol
            return true
        end
        return false            
    end
	

	def check_winner(symbol)

        def generateArr(item,symbol)
    		arr = []
    		item.each do |val|
    			if @matrix[val] == symbol
    			   arr.push(val)
    		    end
    		end	

    		return arr	
    	end
         
		@winCombin.each do  |item|
        		if item == generateArr(item,symbol)
                     return bool = true 
        		end	        	
        	end
        bool = false	
	end	

	def draw?
        for i in 0..8
            if @matrix[i] ==""
                return false
            end 
        end 
        return true
    end	


    def val(cell)
        if cell == ""
            return "-"
        end    
        return cell    
    end    
    def print_mat
        cls
        5.times { print "\n"}
        print "                  #{val(@matrix[0])} | #{val(@matrix[1])} | #{val(@matrix[2])}\n"
        print "                  #{val(@matrix[3])} | #{val(@matrix[4])} | #{val(@matrix[5])}\n"
        print "                  #{val(@matrix[6])} | #{val(@matrix[7])} | #{val(@matrix[8])}\n"
    	5.times { print "\n"}    
    end	

	
end
