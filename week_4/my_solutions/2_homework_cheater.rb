# U2.W4: Homework Cheater


# I worked on this challenge by myself - and then with Natalie a few days later

# 2. Pseudocode

# Input: a title, a topic, a date, a thesis statement, and a pronoun
# Output: Using all of the parameters given, include them mixed with some stock text already input to the method.
# Steps:

=begin

create method called essay writer with the 5 inputs above as parameters. 
create generic template of text to add to thesis statement.
	store that text in variable for easier access
write code that inputs the given paremeters using proper formatting syntax (new lines, line breaks, etc...)
	and, along with the generic templates, create the essay.

=end

# 3. Initial Solution



# def essay_writer(title, topic, date, thesis_statement, pronoun="him")
# 	template_1 = " was a well known person in " 
# 	template_2 = "I like reading about #{pronoun}. "
# 	template_3 = "I defnintely want to learn more!"
# 	puts "#{title}\n\n"
# 	puts "#{topic}" + template_1 + "#{date}." + " " + template_2 + "#{thesis_statement}" + " " + template_3


# end



# 4. Refactored Solution

def essay_writer(title, topic, date, thesis_statement, pronoun)
	pronoun == "male" ? pronoun_use = "him" : pronoun_use = "her"
	essay = "My Brilliant Essay on: #{title}\n\n#{topic} was a well known person in #{date}. I like reading about #{pronoun_use}. #{thesis_statement} I defnintely want to learn more!"
end







# 1. DRIVER TESTS GO BELOW THIS LINE

# essay_writer(title) == "The Rite of Spring" # => doesn't work, along with all the other possibilities
# essay_writer.title == "The Rite of Spring" # => also doens't work...not sure why

p essay_writer("The Rite of Spring", "Igor Stravinsky", 1913, "The premiere of Stravinsky's Rite of Spring was a landmark moment in music history. The music was so controversial that it casued a riot!", "male") == "My Brilliant Essay on: The Rite of Spring\n\nIgor Stravinsky was a well known person in 1913. I like reading about him. The premiere of Stravinsky's Rite of Spring was a landmark moment in music history. The music was so controversial that it casued a riot! I defnintely want to learn more!"
p essay_writer("The First 'First Lady'", "Martha Washington", 1789, "Even though the term 'First Lady' wasn't coined until after her death, Martha Washington played an important role in American history.", "female") == "My Brilliant Essay on: The First 'First Lady'\n\nMartha Washington was a well known person in 1789. I like reading about her. Even though the term 'First Lady' wasn't coined until after her death, Martha Washington played an important role in American history. I defnintely want to learn more!"



# 5. Reflection 

=begin

Yeah, didn't quite catch how to put the essay together on the first go. I got a better handle on that in the refactoring. Again, tests are a disaster. Not really sure what to even test
other than the obvious 'is this a method' type things. I wanted to make sure the given parameters in the method were the same as those in the call, but that doesn't work for me either.
I added a simple ternary function to change the pronoun with the given input. I was, and still am, confused by the fact that the given example had the pronoun as a variable, not a string.
I tried a few different ways to turn that parameter into a variable, but when I'd call it, it would say it's an undefined variable. I may revisit this again this week if I have time, as I'm not terribly
happy with it, but I need to move on to the solo and group challenges.

***UPDATE after pairing
	After I paired with Natalie for this challenge, (I think) the driver code concept became much more clear. Basically, how I would explain it is to think about what you'll be doing at the very end of the 
	process and think about what you want the output to be. Both driver code tests I wrote above were done after the fact, but it is something I feel much more comfortable with now. I look forward
	to working with driver code and TDD more!


=end





















