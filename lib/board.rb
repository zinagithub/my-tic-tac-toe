class Board
	attr_accessor :matrix, :winCombin, :dim
	def initialize(dim)
        @dim        = dim
        @matrix     = Array.new(dim*dim)
        @winCombin =  []
	end
    def init_combin(dim)

        @winCombin  += Array.new(dim ){|l| Array.new(dim){|i| dim * l + i }}  
        @winCombin  += Array.new(dim){|l| Array.new(dim){|i|  l + (i*dim)}}
        @winCombin  += Array.new(1){|l| Array.new(dim){|i|  i+ (i*dim)}}
        @winCombin  += Array.new(1){|l| Array.new(dim){|i|  i*(dim-1) + (dim-1)}}                      

    end    
	def change_mat(index, symbol)
        #@matrix[index] = symbol unless @matrix[index] == nil
         if @matrix[index] == nil
                 @matrix[index] = symbol
             return true
         end
         return false            
    end
	
   def check_winner(symbol)
      @winCombin.each do  |item|
         if  item.all?{|val| @matrix[val] == symbol}
             return true
         end                      
      end
      return false
   end 


	def draw?
        !@matrix.any?{|i| i == nil}
    end	

    
    def print_board(dim)
        cls
        print "\n"
        counter = 0
        @matrix.each do |val|
            print "|" if counter == 0
            
            if val
                print " #{val} "
            else
                print " - "
            end
            counter+=1
            if counter == dim
                counter = 0
                print "|\n"     
            end
        end 
        print "\n"
    end
	
end

 # board = Board.new(5)
 # print "Matrix :"
 # print board.matrix
 # print "\n"
 # board.init_combin(5)
 # print "combin : "
 # print board.winCombin