# U2.W4: 1 Create Accountability Groups


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: an array of everyone in the cohort and a group size integer (group size added after refactoring)
# Output: (6 arrays of 4 people determined randomly 
# Steps:

=begin

create an array called cicadas that includes all members of the cohort
shuffle the array, then divide the array into sub arrays of 4 elements
if the number of original elements is divisible by 4, print out each element array to produce groups
	otherwise, access the last element array and add it first element to the first element array, its second element to the 
	second element array, etc...




=end

# 3. Initial Solution

cicadas = [ "Ken Sin", "Dinesh Rai", "Charu Sharma", "David Kerr" , "Chantelle Turnbull", "Jake Huhn", "Samuel Arkless", 
					"Kai Prout", "Indigo", "Timothy McClung", "Judy Jow", "Danielle Adams", "John P Quigley", "Adeoye Jaiyeola", 
					"Lasse Sviland", "Jessica Tatham", "Kevin Zhou", "Kennedy Bhagwandeen", "Jason Matney", "Gregory Knudsen", 
					"Natalie Baer", "Nick Giovacchini"]

fiddler_crabs = [ 'Adam Godel ', 'Adrian Pask ','Brendan Scarano' ,'Christine Feaster' ,"Howard O'Leary ",'Insung Lee ','Jared Rader ',
                  'Johnathan Weisner' ,'Julia Himmel ','Justin Phelps ','Keaty Gross ','Kenneth Uy ','Lawrence Manfredi ','Neal Fennimore ',
                  'Payam Pakmanesh ', 'Philip London ', 'Ruben Osorio ', 'Ryan Rebo ', 'Sahan Pitigala ', 'Shaun McGeever ', 'Timmy Huang ', 'Tyler Adams'  ]          
												
												
# def group_create(array)
#   shuffled_cicadas = array.shuffle.each_slice(4).to_a
#   i = 0
#   5.times do 
#     shuffled_cicadas[i].push(shuffled_cicadas[-1][i]) 
#     puts "Group Number #{i + 1}: #{shuffled_cicadas[i].compact.to_s}"
#     i += 1
#   end
# end

# group_create(cicadas)


# 4. Refactored Solution

def group_create(array, group_size)
  shuffled_array = array.shuffle.each_slice(group_size).to_a
  i = 0
  number_of_groups = array.length / group_size
  number_of_groups.times do 
    shuffled_array[i].push(shuffled_array[-1][i]) unless array.length % group_size == 0
    puts "Group Number #{i + 1}: #{shuffled_array[i].compact.to_s}"
    i += 1
  end
end

group_create(cicadas, 4)
group_create(fiddler_crabs, 4)


# 1. DRIVER TESTS GO BELOW THIS LINE

p cicadas.is_a?(Array)
p cicadas.shuffle != cicadas
p cicadas.each_slice(4).to_a.length == 6

# 5. Reflection 

=begin

This one was pretty time consuming, but I'm pretty happy with what I came up with...my refactored solution in particular. 
I will say that the driver tests are pretty pathetic. I think I'm still at the point where I'm not sure what I even can test,
so that makes it pretty hard. I know this is the beginning of my TDD life, so I'm not too worried about it. I definitely
spent some time trying to figure out some tests, but I thought it best to get the method to work. A few things took A LOT of
time to figure out. What to do with the remainder array left over, for one. Also, getting the output of the group arrays to
NOT have a 'nil' at the end of them took a while (see #compact). I will say I learned a lot doing this. I now have a general 
know how of accessing the elements of arrays within arrays. I learned about the #each_slice enumerable method - very handy!
I'm pretty happy happy with my refactored solution because I feel like it could be used anytime to create various groups as 
inputs...pretty cool! Plus, I knew putting the actual integers in the original solution was not ideal because that made the method
specific to only the cicadas - it's better now.

=end




