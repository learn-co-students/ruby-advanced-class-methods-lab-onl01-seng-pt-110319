class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize( name = "", artist_name = "" )
    @artist_name = artist_name
    @name = name
  end

  def self.all
    @@all
  end

  def self.create( name = "", artist_name = "" )
    new_song = Song.new( name, artist_name )
    new_song.save
    new_song
  end

  def self.new_by_name( name )
    Song.create( name )
  end

  def self.create_by_name( name )
    Song.new_by_name( name )
  end

  def self.find_by_name( name )
    match = nil
    @@all.each { |song| match = song if song.name == name }
    match
  end

  def self.find_or_create_by_name( name )
    found_name = Song.find_by_name( name )
    found_name == nil ? Song.create_by_name( name ) : found_name
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name[0] }
  end

  def self.new_from_filename( filename )
    separated_name = filename.split( " - ")
    separated_name[1].slice(0..-5)
    Song.create( separated_name[1].slice(0..-5), separated_name[0] )
  end

  def self.create_from_filename( filename )
    Song.new_from_filename( filename )
  end

  def self.destroy_all
    @@all.clear
  end


  def save
    self.class.all << self
  end

end
