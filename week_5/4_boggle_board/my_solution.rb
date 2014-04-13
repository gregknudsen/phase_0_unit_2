# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge by myself.

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode
=begin
	This method uses the existing boggle_board nested array as its board. Each coordinate is given as
	and argument as well. Those coordinates are then mapped into a new array of letters from the board that
	then turns the letters in the array to a string to, presumably, form a word.
=end
# Initial Solution

def create_word(board, *coords)
    coords.map { |coord| board[coord.first][coord.last]}.join("")
end

# Refactored Solution

# N/A

# DRIVER TESTS GO BELOW THIS LINE

  puts create_word(boggle_board, [2,1], [1,1], [1,2], [0,3]) == "code"
  puts create_word(boggle_board, [0,1], [0,2], [1,2]) == "rad"  

# Reflection 
=begin
	Had to look up the '*' character in the parameters. Splat it is. What that does is take all the arguments after 'board', and 
	put them into their own array. If I understand this right, it allows for multiple arguments that refer to the same thing. It's pretty clear why 
	it would be used here - to keep all the coords given together (to avoid coord_1, coord_2, etc. as arguments)
=end


#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
=begin
	create method 'get_row' that accepts 1 argument
	copy 'boggle_board' into the method
	using bracket notation, indicate the row (or, in this case, which array of arrays) to be returned
=end
# Initial Solution

def get_row(row)
	boggle_board = [["b", "r", "a", "e"],
                	["i", "o", "d", "t"],
                	["e", "c", "l", "r"],
                	["t", "a", "k", "e"]]
	
	boggle_board[row]

end

# Refactored Solution

# I wouldn't refactor this.

# DRIVER TESTS GO BELOW THIS LINE

p get_row(0) == ["b", "r", "a", "e"]
p get_row(2) == ["e", "c", "l", "r"]
# Reflection 
=begin
	Fairly straight forward here. I have a feeling thie next exercise will be a little trickier.
=end


#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode
=begin
	create method 'get_col' that accepts 1 argument
	copy 'boggle_board' into the method
	use #transpose method to isolate each column
=end
# Initial Solution

def get_col(col)
	boggle_board = [["b", "r", "a", "e"],
                	["i", "o", "d", "t"],
                	["e", "c", "l", "r"],
                	["t", "a", "k", "e"]]

  boggle_board.transpose[col]              	
end


# Refactored Solution

# Again, I would not refactor this solution.

# DRIVER TESTS GO BELOW THIS LINE
p get_col(1) == ["r", "o", "c", "a"]
p get_col(3) == ["e", "t", "r", "e"]

# Reflection 
=begin
	After searching a bit, this part wasn't nearly as challenging as I though it might be. I thought I might have to create a new
	array and map it, but then I came across #transpose. Done!
=end