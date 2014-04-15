# U2.W6: Testing Assert Statements


# I worked on this challenge by myself.


# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
end
 
name = "bettysue"
assert { name == "bettysue" }
#assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs
=begin
	create method #assert
	have the method raise 'Assertion failed!' unless yield
		what this does is anytime the #assert method is called with a block,
			unless the block returns true, 'Assertion failed' will be invoked.

=end

# 3. Copy your selected challenge here

class CreditCard

	def initialize(card_number)
		raise ArgumentError.new("The number must be 16 digits") unless card_number.to_s.length == 16
		@card_number = card_number
	end

	def assert
		raise "Assertion failed!" unless yield
	end

	def create_array		
		@number_array = @card_number.to_s.split("").map(&:to_i)
	end

	def separate_even_indicies_from_odd
		@even_indices = @number_array.select.each_with_index { |number, index| number if index.even?}
		@odd_indices = @number_array.select.each_with_index { |number, index| number if index.odd?}		
	end

	def double_numbers
		@doubled_evens = @even_indices.map { |number| number.to_i * 2  }
		@separate_doubles = @doubled_evens.map { |number| number.to_s.split("") }			
	end

	def rejoin_arrays
		@final_array = @separate_doubles.flatten.map(&:to_i).concat(@odd_indices)
	end

	def add_all_elements_and_verify
		@final_array.inject(&:+) % 10 == 0
	end

	def check_card
		create_array
		separate_even_indicies_from_odd
		double_numbers
		rejoin_arrays
		add_all_elements_and_verify
	end

end

card = CreditCard.new(4408041234567893)
bad_card = CreditCard.new(4408041234567892)

card.check_card
bad_card.check_card




### 1. DRIVER TESTS GO BELOW THIS LINE

p card.create_array == [4, 4, 0, 8, 0, 4, 1, 2, 3, 4, 5, 6, 7, 8, 9, 3]
p card.separate_even_indicies_from_odd == [4, 8, 4, 2, 4, 6, 8, 3]
p card.double_numbers == [["8"], ["0"], ["0"], ["2"], ["6"], ["1", "0"], ["1", "4"], ["1", "8"]]
p card.rejoin_arrays == [8, 0, 0, 2, 6, 1, 0, 1, 4, 1, 8, 4, 8, 4, 2, 4, 6, 8, 3]
p bad_card.check_card == false





# 4. Convert your driver test code from that challenge into Assert Statements

assert { card.create_array == [4, 4, 0, 8, 0, 4, 1, 2, 3, 4, 5, 6, 7, 8, 9, 3] }
assert { card.double_numbers ==  [["8"], ["0"], ["0"], ["2"], ["6"], ["1", "0"], ["1", "4"], ["1", "8"]] }


# 5. Reflection 
=begin
	Pretty straightforward here. Of course, I say that now having not done any of the other challenges yet. I do understand how
	to convert already existing driver code into assert statements, but, again, that's not too difficult. We'll see
	how the rest of the challenged shape up in terms of TDD. I feel like I'm getting the hang of it, but whenever I say that,
	something always seems to surprise me!
=end