class Board
    #DIM = 3
	attr_accessor :matrix , :winCombin, :dim 
        def initialize(dim)  
        @dim = dim  
        @matrix     = Array.new(dim*dim)
        @winCombin = generate_row_combination(dim) + 
                     generate_column_combination(dim) + 
                     generate_diagonal_combination(dim)
        
	   end
    
    def generate_row_combination(dim)
        return Array.new(dim ){|l| Array.new(dim){|i| dim * l + i }}
    end  

    def generate_column_combination(dim) 
        return Array.new(dim){|l| Array.new(dim){|i|  l + (i*dim)}}
    end

    def generate_diagonal_combination(dim) 
        return Array.new(1){|l| Array.new(dim){|i|  i+ (i*dim)}}+
               Array.new(1){|l| Array.new(dim){|i|  i*(dim-1) + (dim-1)}}
    end
    

    def change_mat(index,symbol)
        return false unless @matrix[index].nil?
        @matrix[index] = symbol
        return true
    end

def check_winner(symbol)
    return true if @winCombin.any? {|combin| combin.all?{|i| @matrix[i] == symbol}}
    false
end    
	def draw?
        !@matrix.any?{|i| i == nil}
    end	

def print_board(dim)
    cls
    @matrix.each_slice(dim) { |a| a.each {|i| 
                        if !i.nil?
                            print " #{i} "
                        else    
                            print " - " 
                        end     
                        }
                        print "\n"}

end	
end
