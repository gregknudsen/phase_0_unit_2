# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge by myself.


# Pseudocode
=begin
	create Song class
	create #initialize method with 2 arguments 'song' & 'artist'	
	create #play method that takes no arguments

	create Playlist class
	create #initialize method that takes one splat argument 'songs'
		'songs' starts as an empty hash
	create #add method that takes one splat arguments 'new_songs'
		adds new playlist objects to 'songs' hash
	create #num_of_tracks	method
		returns 'songs' number of elements
	create #remove method	that takes one 'song' argument
		removes selected song from 'songs' hash
	create #includes? method that takes one 'song' argument
		checks to see if selected 'song' is in 'songs' hash
	create #play_all method 
		plays all songs in 'songs' hash
	create #display method
		displays all songs and artists in 'songs' hash		
=end



# Initial Solution

class Song
	attr_reader :song, :artist

	def initialize(song, artist)
		@song = song
		@artist = artist
		@song_and_artist = []
	end

	def play
		puts "You are now playing #{song}"
	end
end

class Playlist < Song

	def initialize(*songs)
		@songs = Hash[*song_and_artist.flatten]
	end

	def add(*song)
		@songs[song] = artist
		#print @songs
	end

	def num_of_tracks
		puts "There are #{@songs.length} songs in your playlist."
	end

	def remove(song)
		@songs.delete(song)
		puts "You just removed #{song}."
	end

	def includes?(song)
		if @songs.has_key?(song) 
			puts "Yes, #{@songs.key} is a part of your playlist!" 
		else
			puts "Never heard of it."
		end
	end

	def play_all
		@songs.play		
	end

	def display
		puts "Here is your entire playlist:"
		@songs.each do |song, artist|
			puts "#{song}: #{artist}"
		end
	end
	
end




# Refactored Solution






# DRIVER TESTS GO BELOW THIS LINE
one_by_one 			= Song.new("One by One", "Sirenia")
world_so_cold 	= Song.new("World So Cold", "Three Days Grace") 
going_under 		= Song.new("Going Under", "Evanescence")
 
my_playlist 		= Playlist.new(one_by_one, world_so_cold, going_under)
 
lying_from_you 	= Song.new("Lying From You", "Linkin Park")
angels 					= Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
# p my_playlist.num_of_tracks == 5
# going_under.play
# my_playlist.remove(angels)
# p my_playlist.includes?(lying_from_you) == true
# my_playlist.play_all
my_playlist.display





# Reflection 
=begin
	This is as far as I made it on this challenge this week. Of course, it's no where
	close to being functional. I feel like I was on the right track with it, but I couldn't
	get the inputs to work how I wanted. By that, I just couldn't nail down how the 'artist'
	and 'song' should be arranged - either an array or hash. With my limited time this week,
	I just couldn't get this to where I wanted it. 
=end