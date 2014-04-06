# U2.W4: Cipher Challenge


# I worked on this challenge with: Jason Matney.



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.



# def north_korean_cipher(coded_message)
#   input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
#   decoded_sentence = []
#   # cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
#   #           "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
#   #           "g" => "c", 
#   #           "h" => "d", 
#   #           "i" => "e", 
#   #           "j" => "f",
#   #           "k" => "g",
#   #           "l" => "h",
#   #           "m" => "i",
#   #           "n" => "j",
#   #           "o" => "k",
#   #           "p" => "l",
#   #           "q" => "m",
#   #           "r" => "n",
#   #           "s" => "o",
#   #           "t" => "p",
#   #           "u" => "q",
#   #           "v" => "r",
#   #           "w" => "s",
#   #           "x" => "t",
#   #           "y" => "u",
#   #           "z" => "v",
#   #           "a" => "w",
#   #           "b" => "x",
#   #           "c" => "y",
#   #           "d" => "z"}
  
#   alphabet = ("a".."z").to_a
#   cipher = alphabet.rotate()
            
#   input.each do |element| # Iterate through the array
#     found_match = true  # createing a new variable called found_match
#     cipher.each do |coded_element| # What is #each_key doing here?
#       if element == coded_element  # Compare the array element [x] to the key value [y] and run the following block if equivalent
#         puts "I am comparing x and y. X is #{element} and Y is #{coded_element}."
#         decoded_sentence << cipher[coded_element.to_i] # append the hash key at y to array 'decoded_sentence'
#         found_match = false # end of conditional statement
#         break  # signal shift from alphabetival letters to quantity characters 
#       elsif element == "@" || element == "#" || element == "$" || element == "%"|| element == "^" || element == "&"|| element =="*" #Creates a space in the decoded message
#         decoded_sentence << " " # adds a space to 'decoded sentence'
#         found_match = false  # end of conditional statement
#         break # signal shift from quantity characters to numbers
#       else (0..9).to_a.include?(element) # check if a number is in the array
#         decoded_sentence << element # append the array element to decoded_sentence
#         found_match = false # end of conditional statement
#         break # end
#       end 
#     end
#     decoded_sentence << element if found_match == true  # If none of the above conditions are met, element is appended as is
#        # appending 
    
#   end
#   decoded_sentence = decoded_sentence.join("") # concatanate elements of array, turning it into a string
 
#   if decoded_sentence.match(/\d+/) #Regexp checking for one or more digits
#     decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #Substitutes an integer for the digit, divided by 100
#   end  
#   return decoded_sentence # Returns our array in question    
# end

# Your Refactored Solution


def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  decoded_sentence = []
  # cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
  #           "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
  #           "g" => "c", 
  #           "h" => "d", 
  #           "i" => "e", 
  #           "j" => "f",
  #           "k" => "g",
  #           "l" => "h",
  #           "m" => "i",
  #           "n" => "j",
  #           "o" => "k",
  #           "p" => "l",
  #           "q" => "m",
  #           "r" => "n",
  #           "s" => "o",
  #           "t" => "p",
  #           "u" => "q",
  #           "v" => "r",
  #           "w" => "s",
  #           "x" => "t",
  #           "y" => "u",
  #           "z" => "v",
  #           "a" => "w",
  #           "b" => "x",
  #           "c" => "y",
  #           "d" => "z"}
  
  alphabet = ("a".."z").to_a
  cipher = alphabet.rotate(4)
  p cipher
            
  input.each do |element| # Iterate through the array
    found_match = true  # createing a new variable called found_match
    cipher.each do |coded_element| # What is #each_key doing here?
      if element == coded_element  # Compare the array element [x] to the key value [y] and run the following block if equivalent
        puts "I am comparing x and y. X is #{element} and Y is #{coded_element}."
        decoded_sentence << cipher[coded_element.to_i] # append the hash key at y to array 'decoded_sentence'
        found_match = false # end of conditional statement
        p decoded_sentence
        break  # signal shift from alphabetival letters to quantity characters 
      elsif element == "@" || element == "#" || element == "$" || element == "%"|| element == "^" || element == "&"|| element =="*" #Creates a space in the decoded message
        decoded_sentence << " " # adds a space to 'decoded sentence'
        found_match = false  # end of conditional statement
        break # signal shift from quantity characters to numbers
      else (0..9).to_a.include?(element) # check if a number is in the array
        decoded_sentence << element # append the array element to decoded_sentence
        found_match = false # end of conditional statement
        break # end
      end 
    end
    decoded_sentence << element if found_match == true  # If none of the above conditions are met, element is appended as is
       # appending 
    
  end
  decoded_sentence = decoded_sentence.join("") # concatanate elements of array, turning it into a string
 
  if decoded_sentence.match(/\d+/) #Regexp checking for one or more digits
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #Substitutes an integer for the digit, divided by 100
  end  
  return decoded_sentence # Returns our array in question    
end

# Your Refactored Solution

=begin

This is as far as Jason and I got, and I think we did pretty good. I know we could have actually made a refactored method that worked, but time
was against us, and I don't think that was really the point here. We messed with the hash structure to make that MUCH less bulky, and I think
we're on the right track. We'd just need some more time. We did alter some of the variable names for clarity. Unless 'x' and 'y' are numbers, I'm
not a big fan of one letter variable names. All in all, I'm pretty happy with what we came up with, and I look forward to working Jason again.

=end




# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!") #== "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
# p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
# p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
# p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
# p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
# p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"


# Reflection
 