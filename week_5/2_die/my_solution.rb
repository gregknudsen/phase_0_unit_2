# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: an array of strings
# Output: using the #roll method, a random string from the argument array
# Steps:
=begin

raise an ArgumentError if the argument for the instance of Die is an empty array
initialize and assign 'labels' to equal an array (**see reflection--this statement incorrect)
in #sides, return the length of the 'labels' array
in #roll, return a random element from the 'labels' array

=end

# 3. Initial Solution

class Die
  def initialize(labels)
  	raise ArgumentError.new("The array must have at least 1 element") if labels.empty?
  	@labels = labels
  end

  def sides
  	@labels.length
  end

  def roll
  	@labels.sample
  end
end

die = Die.new(["A", "B", "C", "D", "E"])
# bad_die = Die.new([]) will raise ArgumentError

# 4. Refactored Solution

# Again, I don't think I would do anything different here.




# 1. DRIVER TESTS GO BELOW THIS LINE

 puts die.sides 		== 5
 # puts bad_die.sides == 0 will raise ArgumentError

# p labels.count 	== 5   # Ugh, wrong driver code again. Outside of the class, I can't access
# p labels.is_a?(Array)  # the @labels variable. Still not sure what to test other than the
												 # number of sides.


# 5. Reflection 

=begin

Again, pretty straight forward. My biggest issue was the #initialize method. I kept on
wanting to assign 'labels' to an empty array (see pseudocode), but that was a mistake
all along. What I know realize is that labels is turned into an array as a result of the
argument given in the class instance('die'). It doesn't need anymore help to create that
array I realized!

=end
























