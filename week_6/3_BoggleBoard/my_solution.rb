# U2.W6: Create a BoggleBoard Class


# I worked on this challenge by myself.


# 2. Pseudocode



# 3. Initial Solution
class BoggleBoard
 
  def initialize(board)
  	@board = board
  end

  def create_word(board, *coords)
    coords.map { |coord| board[coord.first][coord.last]}.join("")
	end

	def get_row(board, row)
		board[row]
	end

	def get_col(board, col)
  	board.transpose[col]              	
	end
end
 
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)
 
p boggle_board.get_row(dice_grid, 0) 
p boggle_board.get_row(dice_grid, 1) 
p boggle_board.get_row(dice_grid, 2) 
p boggle_board.get_row(dice_grid, 3) 
p boggle_board.get_col(dice_grid, 0) 
p boggle_board.get_col(dice_grid, 1) 
p boggle_board.get_col(dice_grid, 2) 
p boggle_board.get_col(dice_grid, 3)  

# this equals
# ["b", "r", "a", "e"]
# ["i", "o", "d", "t"]
# ["e", "c", "l", "r"]
# ["t", "a", "k", "e"]
# ["b", "i", "e", "t"]
# ["r", "o", "c", "a"]
# ["a", "d", "l", "k"]
# ["e", "t", "r", "e"]


# 4. Refactored Solution

# At this point, I wouldn't refactor this code.




# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:

p boggle_board.create_word(dice_grid, [1,2], [1,1], [2,1], [3,2]) # => dock
boggle_board.get_row(dice_grid, 0) # => ["e", "c", "l", "r"]
boggle_board.get_col(dice_grid, 0) # => ["r", "o", "c", "a"]
p boggle_board.create_word(dice_grid, [3,1]) == "a"
p boggle_board.create_word(dice_grid, [3,2]) == "k"

# 5. Reflection 