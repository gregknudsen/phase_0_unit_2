# U2.W5: Virus Predictor

# I worked on this challenge Gavin Stark - VP of Product Development for Real Digital Media.
# I had asked my cohort if they were able to pair for this on a particular night, but no one was
# available. Because this one was kind of twisting me brain (see line 96), I contacted Gavin to help me out. 
# He's awesome! And he has been a great help for me the past year. I'll write comments throughout and in 
# my reflection what he helped me most with.

# EXPLANATION OF require_relative
# This makes it so this file can use the information from the 'state_data' file
#
require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  def virus_effects  #HINT: What is the SCOPE of instance variables? - they are class variables
                      # this is the method being called to include all the virus effect on each state
                      # We also don't need the arguments for these methods, as the class already has access
                      # to them.
    predicted_deaths
    speed_of_spread
  end

  private  #what is this?  what happens if it were cut and pasted above the virus_effects method
            # it would prevent the class instances from accessing the 'virus_effects' method 
            # because it would then become private  
  def predicted_deaths
    #method that calculates deaths based on population density. The .floor method rounds the number down and removed the decimal point

    # if    @population_density >= 200 then number_of_deaths = (@population * 0.4).floor
    # elsif @population_density >= 150 then number_of_deaths = (@population * 0.3).floor
    # elsif @population_density >= 100 then number_of_deaths = (@population * 0.2).floor
    # elsif @population_density >= 50  then number_of_deaths = (@population * 0.1).floor
    # else                                  number_of_deaths = (@population * 0.05).floor
    # end
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end

  def number_of_deaths   
    scale_factor = case
                    when @population_density >= 200 then 0.4
                    when @population_density >= 150 then 0.3
                    when @population_density >= 100 then 0.2
                    when @population_density >= 50  then 0.1
                    else                                 0.05
                  end
   (@population * scale_factor).floor
    # After messing around with something similar above (from lines 38-43 was kind of what I was thinking), Gavin came up with
    # this solution - to make #number_of_deaths its own method that's called in the #predicted_deaths
    # method. Funny thing is it changes 'number_of_deaths' in line 45 from a variable to a method call!
    # It's also very cool how the computation is only done in 1 place on line 58, as opposed to having it
    # listed on every line of the method. Love this solution, and it's very easy to read!
   end

  def speed_of_spread #in months
    puts " and will spread across the state in #{speed} months.\n\n"
  end

  def speed
    # method that calculates how many months it will take for virus to spread based on population density
    # I constructed this one myslef, but I claerly used Gavin's idea for it's shape. He had pointed out the
    # multiple times we saw the '+=' operator, and that it could be cleaned up. The entire statement is 
    # all about defining 'speed', so why redefine it so many times. Much cleaner and more DRY. I also like the
    # idea of giving speed it's own method, since that all it worries about.
    speed = case
              when @population_density >= 200 then 0.5
              when @population_density >= 150 then 1
              when @population_density >= 100 then 1.5
              when @population_density >= 50  then 2
              else                                 2.5
            end
  end
end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state_name, state_data|
  predictor = VirusPredictor.new(state_name, state_data[:population_density], state_data[:population], state_data[:region], state_data[:regional_spread])
  predictor.virus_effects
end

=begin
  the Hash#each method seen on lines 90-93 are the real reason I contacted Gavin for this one. What I realized after working through the problem with
  him was that I was just trying to do way too much stuff. I think I made the comment to him that 'The less you know about programming, the more you
  think you need to do', and I truly believe that. I was accessing the hard numbers of the 'STATE_DATA' hash and trying to manipulate every single little
  piece of data, and I was spinning my wheels. What he came up with does exactly what it needs to do while still being very easy to read and understand
  what information is being requested. This was a great learning exerience for me, and I'll now try to start looking at various challenges from a big picture
  standpoint at least at first before I start getting too complex.
=end



# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
# alaska.virus_effects