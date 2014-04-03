# U2.W4: Separate Comma Solo Challenge


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: any integer
# Output: a string of the integer input with commas, if needed, in the proper place 
# Steps:

=begin

create method separate_comma with one parameter - an integer
convert the given integer to a string and then to an array
establish the length of the array
using the length as a guide, iterate through the array to determine where
and how many commas are needed

=end

# 3. Initial Solution

# def separate_comma(number)
# 	i = -4
# 	number_array = number.to_s.split("")
# 	if number_array.length <= 3
# 		number.to_s
# 	elsif number_array.length <= 6
# 		number_array.insert(i, ",")
# 		number_array.join("")
# 	else number_array.length <= 9
# 		number_array.insert(i, ",")
# 		i -= 4
# 		number_array.insert(i, ",")
# 		number_array.join("")
# 	end
# end

# puts separate_comma(322)
# puts separate_comma(322342)
# puts separate_comma(322334242)
# puts separate_comma(3223)


# 4. Refactored Solution

def separate_comma(number)
	i = -4
	numbers_array = number.to_s.split("")
	if numbers_array.length >= 10
		numbers_array.insert(i, ",")
		i -= 4
		numbers_array.insert(i, ",")
		i -= 4
		numbers_array.insert(i, ",")
		numbers_array.join("")
	elsif numbers_array.length >= 7
		numbers_array.insert(i, ",")
		i -= 4
		numbers_array.insert(i, ",")
		numbers_array.join("")
	elsif numbers_array.length  >=4
		numbers_array.insert(i, ",")
		numbers_array.join("")	
	else 
		number.to_s
	end
end






# 1. DRIVER TESTS GO BELOW THIS LINE

# These were created after the fact. I feel better about driver code now, though.

p separate_comma(1000) 						== "1,000"
p separate_comma(100000) 					== "100,000"
p separate_comma(1000000) 				== "1,000,000"
p separate_comma(1000000000) 			== "1,000,000,000" 
p separate_comma(1000000000000) 	== "1,000,000,000,000" # doh



# 5. Reflection 

=begin

Ok, this could be the single worst piece of code I've ever written. It does the job, I guess 
but damn, it's ugly. It's most definitely NOT D.R.Y. In my refactoring, I tinkered with
replacing the repeated #insert expressions with a variable, but that didn't seem to work.
What I did do is reverse the order of evaluation. I think this is a little safer to guarantee
the right numbers are evaluated (Rethinking this, it doesn't really matter). I know there is a MUCH better way to do this, and I look 
forward to the review portion to see what others did. Bottom line, I made something that works,
but it's far from ideal.

=end
































