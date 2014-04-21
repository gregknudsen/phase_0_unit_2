# U2.W6: Refactoring for Code Readability


# I worked on this challenge with: Jason Matney.


# Original Solution

##################################
## Initial solution Misterdamon ##
##################################
=begin
class CreditCard
	def initialize(card_number)
		if card_number.to_s.length != 16
			raise ArgumentError.new("You have given an invalid card format.")
		end
		@card_number = card_number
  end

  def check_card
  	output = []
  	temp = @card_number.to_s.split('').reverse.map!(&:to_i) 
  	
  	temp.each_with_index do |elem,i|
  		output << elem * 2 if i.odd? 
  		output << elem if i.even? 
 		end

  	total = 0
  	output.each do |num| 
  		if num >= 10
  			num.to_s.split('').each { |x| total += x.to_i } 
  		else
  			total += num 
  		end 
  	end 
  	
  	return false if total % 10 != 0 
  	true 
  end 
end
=end


# Refactored Solution

#########################################
## Refactored Solution for Misterdamon ##
#########################################


class CreditCard
	def initialize(card_number)
		raise ArgumentError.new("You have given an invalid card format.") unless card_number.to_s.length == 16 # changed to one line 'unless' statement
		@card_number = card_number
  end
  
  def reverse_digit_array # create separate method for this task
    @card_reverse = @card_number.to_s.split('').reverse.map!(&:to_i) 
  end
  
  def double_digits_at_odd_indices # create separate method for this task
    @output = []
    @card_reverse.each_with_index do |elem,i|
    	@output << elem * 2 if i.odd? 
    	@output << elem if i.even? 
   	end
   	@output
 	end
   
  def check_card # not totally happy with functionality. Still cleaned up syntax a bit.
    reverse_digit_array
    double_digits_at_odd_indices
    total = 0
  	@output.each do |num| 
  	  num > 10 ? num.to_s.split('').each { |x| total += x.to_i } : total += num # added ternary
  	end
  	puts total
  	return false if total % 10 != 0 
  	true 
  end 
end



def assert
  raise "Assertion failed!" unless yield
end

card1 = CreditCard.new(4408041234567894)
card2 = CreditCard.new(4408041234567892)

# p card1.reverse_digit_array
# p card1.double_digits_at_odd_indices
p card1.check_card

# DRIVER TESTS GO BELOW THIS LINE

puts CreditCard.instance_method(:check_card).arity == 0
puts CreditCard.instance_method(:initialize).arity == 1
assert { card1.reverse_digit_array == [4, 9, 8, 7, 6, 5, 4, 3, 2, 1, 4, 0, 8, 0, 4, 4] }
assert { card1.double_digits_at_odd_indices == [4, 18, 8, 14, 6, 10, 4, 6, 2, 2, 4, 0, 8, 0, 4, 8] }




# Reflection 
=begin
	Jason and I picked this exercise at random from someone we didn't know. It turns
	out it was, in my opinion, a pretty good exercise. I like a lot of Damon did. What
	Jason and I did was try to split it up a little into smaller bits. Damon had a huge
	#check_card method with a lot of moving parts, and we separated a few of the tasks.
	I know we both were not completely satisfied with our final refactoring, but we both
	thought an hour and a half was a good place to stop.
=end