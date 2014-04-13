# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: a new instance of the class with a 16 digit number as its argument
# Output: true for a valid card, false for an invalid card
# Steps:
=begin
	create #initialize method with one parameter 'card_number'
	raise ArgumentError if number is not 16 digits
	initialize 'card_number'
	
	create #create_array that turns the 'card_number' into an array and then separates
	the even index elements from the odd index elements into their own arrays ('even_indicies' and
	'odd_indicies')

	create #separate_array that separates the array into one with the values of the even indicies
	and one with the values from the odd indicies
	
	create #double_numbers that first converts all elements into integers from strings, then
	takes the 'even_indecies' array and doubles all the digits, then it will add that array
	to 'odd_indicies' to create 'final_array'
	
	create #check_card method that takes no parameters 
		it will take the 'final_array' sum of the result of numbers and divide it by 10
			if the result is 0, the card is valid and produces 'true'
				otherwise, the result is 'false'

=end  

# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
# class CreditCard

# 	def initialize(card_number)
# 		raise ArgumentError.new("The number must be 16 digits") unless card_number.to_s.length == 16
# 		@card_number = card_number
# 	end

# 	def create_array		
# 		@number_array = @card_number.to_s.split("")
# 		@number_array.map! { |number| number.to_i }
# 	end

# 	def separate_array
# 		@even_indicies = @number_array.select.each_with_index { |number, index| number if index.even?}
# 		@odd_indicies = @number_array.select.each_with_index { |number, index| number if index.odd?}		
# 	end

# 	def double_numbers
# 		@doubled_evens = @even_indicies.map { |number| number.to_i * 2  }
# 		@separate_doubles = @doubled_evens.map do |number|
# 			number.to_s.length == 2 ? number.to_s.split("") : number			
# 		end
# 	end

# 	def check_card
# 		create_array
# 		separate_array
# 		double_numbers
# 		final_array = @separate_doubles.flatten.map { |number| number.to_i }.concat(@odd_indicies)
# 		final_array.inject {|number, sum| number + sum } % 10 == 0
# 	end

# end

# card = CreditCard.new(4408041234567893)

# p card.check_card



# 4. Refactored Solution

class CreditCard

	def initialize(card_number)
		raise ArgumentError.new("The number must be 16 digits") unless card_number.to_s.length == 16
		@card_number = card_number
	end

	def create_array		
		@number_array = @card_number.to_s.split("").map(&:to_i)
	end

	def separate_even_indicies_from_odd
		@even_indicies = @number_array.select.each_with_index { |number, index| number if index.even?}
		@odd_indicies = @number_array.select.each_with_index { |number, index| number if index.odd?}		
	end

	def double_numbers
		@doubled_evens = @even_indicies.map { |number| number.to_i * 2  }
		@separate_doubles = @doubled_evens.map do |number|
			number.to_s.length == 2 ? number.to_s.split("") : number			
		end
	end

	def rejoin_arrays
		@final_array = @separate_doubles.flatten.map(&:to_i).concat(@odd_indicies)
	end

	def add_all_elements
		@final_array.inject(&:+) % 10 == 0
	end

	def check_card
		create_array
		separate_even_indicies_from_odd
		double_numbers
		rejoin_arrays
		add_all_elements
	end

end

card = CreditCard.new(4408041234567893)
bad_card = CreditCard.new(4408041234567892)

card.check_card
bad_card.check_card




# 1. DRIVER TESTS GO BELOW THIS LINE

p card.create_array == [4, 4, 0, 8, 0, 4, 1, 2, 3, 4, 5, 6, 7, 8, 9, 3]
p card.separate_even_indicies_from_odd == [4, 8, 4, 2, 4, 6, 8, 3]
p card.double_numbers == [8, 0, 0, 2, 6, ["1", "0"], ["1", "4"], ["1", "8"]]
p card.rejoin_arrays == [8, 0, 0, 2, 6, 1, 0, 1, 4, 1, 8, 4, 8, 4, 2, 4, 6, 8, 3]
p bad_card.check_card == false




# 5. Reflection 
=begin
	I spent a lot of time in IRB and Code Runner working this challenge out. After much googling,
	I found what I needed in terms of finding every task that needed to be done. The most challenging
	aspect was navigating when the elements had to be strings and when they had to be integers. I think
	what I came up with kind of had to be the way to do it. In order to #split anything into an array,
	the elements have to be strings, and what I needed to do with a couple of the tasks forced me to
	switch back and forth between the two - Integer and String. In my refactoring, I cleaned up some
	syntax as well as creating a new method. It just seemed like the #rejoin_arrays method needed
	to be its own entity. Also, at the last minute, I created the #add_all_elements method. That
	calculation just seemed out of place in the #check_card method. I'm not sure if I did too
	much in terms of method creation, but at least it's good practice! Fun challenge!

=end
