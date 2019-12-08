require 'pry'
class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def Song.create
    @@all << Song.new
    @@all.last
  end
  
  def Song.new_by_name(name)
    Song.create.name = name
    @@all.last
  end
  
  def Song.create_by_name(name)
    Song.create.name = name
    return self.all.last
  end
  
  def self.find_by_name(name)
    @@all.find{|p| p.name == name}
  end
  
  def Song.find_or_create_by_name(name)
    if self.find_by_name(name)
      puts "Aleady here!"
      self.find_by_name(name)
    else
       self.create_by_name(name)
    end
  end
  
  def Song.alphabetical
    self.all.sort_by{|s|s.name}
  end
  
  def self.new_from_filename(file)   
    arr = file.split(".mp3")
    sng = arr[0].split(" - ")
       artist_name = sng[0]
       name = sng[1]
    #   binding.pry
     song = Song.create_by_name(name)
     song.artist_name = artist_name
    song
  end
  
  def Song.create_from_filename(file)
    arr = file.split(".mp3")
    sng = arr[0].split(" - ")
       artist_name = sng[0]
       name = sng[1]
    #   binding.pry
     song = Song.create_by_name(name)
     song.artist_name = artist_name
    song
  end
  
  def Song.destroy_all
    @@all.clear
  end
  #binding.pry
end
