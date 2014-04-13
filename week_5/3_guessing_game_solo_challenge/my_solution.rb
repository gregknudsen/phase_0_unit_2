# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: a new GuessingGame ('game') with the argument serving as the answer
					# followed by a guess
# Output: either :high, :low, or :correct depending on the guess
# Steps:
=begin
set @answer to = answer
create #guess method that accepts single argument ('guess')
set #solved? to 'false'
create case statement for different outcomes of guesses
	:high for a guess too high
	:low for a guess too low
	if :correct, set #solved? to 'true'
create #solved? method with no arguments
	sets #solved to 'false' after incorrect guess

=end

# 3. Initial Solution

class GuessingGame
 

  def initialize(answer)
  	@answer = answer
    @solved = false
  end

  def solved?
    @solved
  end
  
  def guess(guess)
  	case 
  	when guess > @answer
  		solved = false
      :high
    when guess < @answer
      @solved = false
      :low      
    else guess == @answer
    @solved = true
    :correct
  	end
  end  
end

game = GuessingGame.new(10)
# puts game.solved?
#game.guess(7)
# p game.guess(11)
#game.guess(10)
#p game.solved?



# 4. Refactored Solution

# Not sure I'd want to refactor this.




# 1. DRIVER TESTS GO BELOW THIS LINE

#p game.guess(7)   == 7 # this is false...not sure why
p game.guess(7)   == :low # figured it out :)
p game.solved?    == false
p game.guess(11)  == :high
p game.solved?    == false
p game.guess(10)  == :correct
#p game.guess(10)  == 10 # same as line 72...not sure about this
#p game.answer 	  == 10 # doesn't work either...no access to 'answer'
p game.solved? 	  == true



# 5. Reflection 
=begin
  It took a little time to figure out that I needed to set @solved to false in the
  #initialize method. When I did this, things seemed to fall into place. I decided to use
  a case statement rather than an if/else...just preference, I guess. I am a bit
  confused as to why lines 72 and 74 come up false, since it does recognize the 
  #solved? statements as false and true, respectively. **obviously, I figured this problem
  out after I just took away the '==' and print whatever the guess what.
=end