# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1) Ken Sin
# 2) Greg Knudsen

 # This is the file you should end up editing. 
 
def bakery_num(num_of_people, fav_food) # this line defines method bakery_num
  my_list = {
            "pie" => 8, 
            "cake" => 6, 
            "cookie" => 1
            }
  pie_qty = 0
  cake_qty = 0
  cookie_qty = 0
  
  has_fave = false

  my_list.each_key do |k| # probably change k to food
    if k == fav_food # is the second argument
      has_fave = true
      fav_food = k # probably change fav_food variable name
    end
  end
  
  if has_fave == false
    raise ArgumentError.new("You can't make that food")
  else
    fav_food_qty = my_list.values_at(fav_food)[0] # stores the value of fav_food
    if num_of_people % fav_food_qty == 0 
      num_of_food = num_of_people / fav_food_qty
      return "You need to make #{num_of_food} #{fav_food}(s)."
    else 
      while num_of_people > 0
        if num_of_people / my_list["pie"] > 0 # 5r1 true
          pie_qty = num_of_people / my_list["pie"] #5
          num_of_people = num_of_people % my_list["pie"] #1
        elsif num_of_people / my_list["cake"] > 0 # 0
          cake_qty = num_of_people / my_list["cake"] #0
          num_of_people = num_of_people % my_list["cake"] #1
        else
          cookie_qty = num_of_people #1
          num_of_people = 0 #0
        end
      end
      return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)."
    end
  end
  
end

#### REFACTORED CODE

def bakery_num(num_of_people, fav_food) # this line defines method bakery_num
  my_list = {
            "pie" => 8, 
            "cake" => 6, 
            "cookie" => 1
            }

  pie_qty, cake_qty, cookie_qty = 0, 0, 0   
  
  has_fave = false

  my_list.each_key do |list_item| # probably change k to food
    has_fave = true if list_item == fav_food # is the second argument
  end
  
  if has_fave
    fav_food_qty = my_list[fav_food] # stores the value of fav_food => [8]
    if num_of_people % fav_food_qty == 0 
      num_of_food = num_of_people / fav_food_qty
      return "You need to make #{num_of_food} #{fav_food}(s)."
    else 
      while num_of_people > 0
        if fav_food == "pie" && num_of_people / my_list["pie"] > 0
          pie_qty = num_of_people / my_list["pie"]
          num_of_people %= my_list["pie"]
        elsif fav_food == "cake" && num_of_people / my_list["cake"] > 0
          cake_qty = num_of_people / my_list["cake"]
          num_of_people %= my_list["cake"]      
        elsif num_of_people / my_list["pie"] > 0 
          pie_qty = num_of_people / my_list["pie"] 
          num_of_people %= my_list["pie"] 
        elsif num_of_people / my_list["cake"] > 0 
          cake_qty = num_of_people / my_list["cake"] 
          num_of_people %= my_list["cake"] 
        else
          cookie_qty = num_of_people
          num_of_people = 0
        end
      end
      return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)."
    end
  else
      raise ArgumentError.new("You can't make that food")
  end
end
 

#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 0 pie(s), 6 cake(s), and 5 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!


















