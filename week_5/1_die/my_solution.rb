# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: an instance of the Die class (say, 'die') with an integer for an argument
# Output: a random number between 1 and the given argument
# Steps:
=begin
	The initial structure was set up already, so next I need to:
	create an instance variable for 'sides' - the lone argument for the instance of the 
	class Die
	in the sides method, just return the number of sides given in the argument
	in the roll method, use the rand method to produce a random number between
	1 and the number given for sides
=end

# 3. Initial Solution

# class Die
#   def initialize(sides)
#     raise ArgumentError.new("The number must be positive") if sides < 1
#     @sides = sides
#   end
  
#   def sides
#   	@sides
#   end
  
#   def roll
#     rand(1..@sides)
#   end
# end

# die = Die.new(1000)
# #bad_die = Die.new(-1)

# puts die.sides
# puts die.roll
#puts bad_die.roll


# 4. Refactored Solution

class Die
  def initialize(sides)
    raise ArgumentError.new("The number must be positive") if sides < 1
    @sides = sides
  end
  
  def sides
  	@sides
  end
  
  def roll
    rand(1..@sides)
  end
end

die = Die.new(1000)
# bad_die = Die.new(-3)


# 1. DRIVER TESTS GO BELOW THIS LINE


p die.sides == 1000
p die.roll == rand(0..1000) # this comes out false. I think testing a random outcome
														# will generally not work
#p bad_die.roll will raise ArgumentError







# 5. Reflection 

=begin
	
	Fairly straight forward challenge here. I was actually confused a bit by the
	sides method. (My bit of pseudocode for the sides method was written after the 
	the fact) It became clear to me when I read the rspec test for #sides. Just return
	the number given in the instance of the class (die in this case). As usual, I initially
	overthought what I had to do. Also, I was exactly clear where to raise the ArgumentError.
	I initially had it in the #sides method, but the reference page that DBC gave ultimately
	told me to 1) put it in the #initialize method, and 2) to put it FIRST
	All in all, pretty straight forward. I am still not sure how I could refactor this
	either. When I review, I'm sure I'll get some ideas.	

=end















