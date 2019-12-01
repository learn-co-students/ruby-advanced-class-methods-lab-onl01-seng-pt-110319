class Song 
  attr_accessor :name, :artist_name 
  @@all = []
  
  def self.all
    @@all
  end 
  
  def save
    self.class.all << self 
  end 
  #instantiates and saves the song, and it returns the new song that was created 
  def self.create 
    song = self.new 
    song.save
    song 
  end 
  #instantiatesa song with a name property 
  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song
  end 
  #instantiates and saves a song with a name property
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    song.save
    song 
  end 
  #can find a song present in @@all by name
  #returns falsey when a song name is not present in @@all 
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name }
  end 
#invokes .find_by_name and .create_by_name instead of repeating code 
#returns the existing Song object (doesn't create a new one) when provided the title of an existing song 
#creates a new Song object with the provided title if one doesn't already exist 
  def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
  end
#returns all the song instances in alphabetical order by song name 
  def self.alphabetical
    @@all.sort_by{|song| song.name } 
 end 
 #initializes a song and artist_name based on the filename format
 def self.new_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = Song.new 
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end 
  #initializes and saves a song and artist_name based on the filename format 
  def self.create_from_filename(name)
    song = Song.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end 
  #clears all the song instances from the @@all array 
  def self.destroy_all 
    self.all.clear 
  end 
 
end 
