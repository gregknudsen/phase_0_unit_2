# U2.W4: Refactor Cipher Solution


# I worked on this challenge by myself.


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

# ORIGINAL SOLUTION FROM FILE

# def translate_to_cipher(sentence)
#     alphabet = ('a'..'z').to_a # creates an array of the alphabet, inclusive of 'z'
#     cipher = Hash[alphabet.zip(alphabet.rotate(4))] 

#     # p cipher (did this to see what it was creating - sure enough it's the hash from the previous exercise)

#     # Ah! This is what Jason and I couldn't figure out. This is where you create the hash MUCH more efficiently by
#     # declaring 'Hash'.  At first glance, I would not think that the #zip method is needed. I tried it out here and 
#     # in IRB, and it says "undefined method `alphabet' for main:Object". What #zip does is turns the argument into their
#     # own arrays. Now I see. Zip is turning 'alphabet' into [['a'],['b'], ['c'], etc...]. I assume this is what makes it
#     # possible to be the key in the hash - since the keys have to be unique! Will address #rotate below
    
#     spaces = ["@", "#", "$", "%", "^", "&", "*"] # creates array of those particular characters. 
    
#     original_sentence = sentence.downcase # changes every letter of 'sentence' string to lower case
#     encoded_sentence = [] # an empty array and acts as placeholder until the final sentence is completed
#     original_sentence.each_char do |element| # iterating over each character of the 'sentence' string
#       if cipher.include?(element) # if the cipher includes one of those characters
#         encoded_sentence << cipher[element] # add that element to the 'encoded_sentence' array
#       elsif element == ' ' # or, if the 'sentence' string has a space
#         encoded_sentence << spaces.sample # insert one of the characters RANDOMLY from the 'spaces' array wherever there is a space
#       else 
#         encoded_sentence << element # Lines 34 and 35 are superfluous here, since line 31 is already doing this.
#       end
#      end
    
#     return encoded_sentence.join # This turns the array into a string with whatever argument is given in between each element. The default argument is ("")
# end

# MY REFACTORED SOLUTION:

def translate_to_cipher(sentence)
    alphabet = ('a'..'z').to_a
    cipher = Hash[alphabet.zip(alphabet.rotate(-4))] # changed this to -4
    # spaces = ["@", "#", "$", "%", "^", "&", "*"] - now unecessary, as any character other than a letter will replace it with a space
    
    original_sentence = sentence.downcase
    encoded_sentence = []
    original_sentence.each_char do |element|
      cipher.include?(element) ? encoded_sentence << cipher[element] : encoded_sentence << " " # closer to functionality of original
     end
    
    return encoded_sentence.join
end

# Questions:
# 1. What is the .to_a method doing? - see line 16

# 2. How does the rotate method work? What does it work on? - it rotates the elements n positions of the array where n is the integer given 
# as the argument. The default argument is '1', and this shifts all the elements of the array one index to the left (the first element will move to the end)
# It does accept negative integers, which shifts the elements to the right n times

# 3. What is `each_char` doing? see line 31

# 4. What does `sample` do? - see line 35

# 5. Are there any other methods you want to understand better? - messing with #zip in IRB. I understand how it's working here (I think), but
# I want to look at it a bit more, as I think it could be very useful in the future.

# 6. Does this code look better or worse than your refactored solution
#    of the original cipher code? What's better? What's worse?
# Certainly, the hash creation is worlds better than the original. I did create another refactored solution with a ternary statement that
# removes some unnecessary syntax. See next question for more.

# 7. Is this good code? What makes it good? What makes it bad?

# There's some good and some not so good. I had to refactor the solution to get it 'mostly' working. The only thing now that is different 
# is the use of the numbers - taking a number given in the cipher and dividing it by 10. The if/elsif statement was way too bulky, so I 
# cleaned it up with the ternary statement.


# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time? -yes, except for the random characters from the spaces array (original solution from this page)
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")

# Refactored Driver Code
p translate_to_cipher("e$swjp&ykkgeao") == "i want cookies" # this is false if argument of rotate is (-4)
p translate_to_cipher("m%aerx^gssomiw") == "i want cookies" # this is true; false if argument of rotate is (4)





# 5. Reflection 

=begin
  
A lot of my reflection is included in the comments and refactoring. I wasn't quite sure if I needed to put the full
functionality back in the method (I didn't), so I just put a few things back in. I actually really enjoy refactoring.
I like to experiment a lot, and refactoring lends itself to that. I think a lot of that stems from my not knowing
what a lot of the methods do yet, so when I have more experience, I'll still be able to mess around with the code, but
I'll be much more efficient about it. This was fun!
  
=end

