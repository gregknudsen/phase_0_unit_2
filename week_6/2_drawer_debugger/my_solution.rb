# U2.W6: Drawer Debugger


# I worked on this challenge by myself (and then with David Kerr).


# 2. My Original Code

class Drawer

	attr_reader :contents

# Are there any more methods needed in this class?

	def initialize
		@contents = []
		@open = true
	end

	def assert
		raise "Assertion failed!" unless yield
	end

	def open
		@open = true
	end

	def close
		@open = false
	end 

	def add_item(item)
		puts "You just added #{item.type}!"
		@contents.push(item.type)
	end

	def remove_item(item) #what is `#pop` doing? - well, it 'was' removing the last object added, but I didn't like that. I would rather one be able to remove
		@contents.delete("#{item.type}")						# any item they like. 
		puts "You just removed #{item.type}!"
		
	end

	def dump  # what should this method return? - an empty
		@contents.length.times { @contents.pop }
		puts "Your drawer is empty."
		@contents
	end

	def view_contents
		if @contents.empty?
			puts "There is nothing in the drawer!"
		else	
			puts "The drawer contains:"
			@contents.each {|silverware| puts "- " + silverware }
		end
	end
end	


class Silverware 
	attr_reader :type

	# Are there any more methods needed in this class?

	def initialize(type, clean=true)
		@type = type
		@clean = clean
	end
	
	def assert
		raise "Assertion failed!" unless yield
	end
	
	def eat(type)
		puts "eating with the #{@type}"
		@clean = false
	end

	def clean_silverware
		@clean
	end
end

#2A Code with David

		# class Drawer

		# 	attr_reader :contents

		# # Are there any more methods needed in this class?

		# 	def initialize
		# 		@contents = []
		# 		@open = true
		# 	end

		# 	def open
		# 		@open = true
		# 	end

		# 	def close
		# 		@open = false
		# 	end 

		# 	def add_item(item)
		# 		@contents << item
		# 	end

		# 	def remove_item(item) #what is `#pop` doing?
		# 		@contents.delete(item)
		# 	end

		# 	def dump  # what should this method return?
		# 		@contents.length.times { @contents.pop }
		# 		puts "Your drawer is empty."

		# 	end

		# 	def view_contents
		# 		puts "The drawer contains:"
		# 		@contents.each {|silverware| puts "- " + silverware.type }
		# 	end

		# end


		# class Silverware
		# 	attr_reader :type

		# # Are there any more methods needed in this class?

		# 	def initialize(type, clean = true)
		# 		@type = type
		# 		@clean = clean
		# 	end

		# 	def eat
		# 		puts "eating with the #{type}"
		# 		@clean = false
		# 	end

		# 	def clean_silverware
		# 		puts "You're silverware is clean!"
		# 	end
		# end

def assert
		raise "Assertion failed!" unless yield
end

knife					= Silverware.new("knife")
spoon 				= Silverware.new("spoon")
fork 					= Silverware.new("fork")
sharp_knife 	= Silverware.new("sharp knife")
butter_knife 	= Silverware.new("butter knife")

silverware_drawer = Drawer.new

silverware_drawer.add_item(knife) 
silverware_drawer.add_item(spoon)
silverware_drawer.add_item(fork) 
p silverware_drawer.contents

silverware_drawer.view_contents
silverware_drawer.remove_item(fork)
p silverware_drawer.contents
silverware_drawer.view_contents


silverware_drawer.add_item(sharp_knife)
silverware_drawer.view_contents

silverware_drawer.remove_item(sharp_knife)
# #removed_knife.eat
sharp_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return?

silverware_drawer.add_item(fork)
silverware_drawer.remove_item(fork) #add some puts statements to help you trace through the code...
fork.eat(fork)
silverware_drawer.add_item(butter_knife)
silverware_drawer.remove_item(fork)
silverware_drawer.remove_item(butter_knife)
butter_knife.eat(butter_knife)

#BONUS SECTION
fork.clean_silverware
p fork.clean_silverware

# DRIVER TESTS GO BELOW THIS LINE

assert { silverware_drawer.contents == [] } # doesn't work, and I don't know why :(





# 5. Reflection 

=begin
	I'm not done tinkering with this just yet, but I've done basically what I set out to do. I got the code working the
	way it should. Create a new Drawer. Add items to it and remove them while keeping track of those two actions. My #assert
	method is not working, and that's pretty frustrating. It says it's undefined, but I don't see how that's possible. I've defined
	them in each class as well as in both, but still no luck. I'm guessing the answer is obvious, but we'll see. I also still want to work
	out the #clean_silverware method. I'll come back to that if I have time.

	I spent the next night working on this with David, and that was very cool to go through
	it again with another set of eyes. Mostly, we were on the same page. There was one small
	revelation for me. It was about the assert method. In the previous exercise, I put the
	assert method within the class, and it worked just fine. In this exercise, that wasn't
	the case. It turns out that the #asset method works all the time if it is outside the
	class. I'm sure this will make sense to me soon.	
=end























