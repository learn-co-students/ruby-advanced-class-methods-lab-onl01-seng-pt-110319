class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def inititalize(name)
  #   @name = name
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  song = Song.new
  song.save
  song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
  song = Song.new
  song.name = name
  song.save
  song
  end

  def self.find_by_name(song_name)
    # @@all.detect{ |name| Song.name == name}

    self.all.find{ |song| song.name  == song_name}
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    #   self.create_by_name(name)
    # end
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    # @@all.sort { |a, b| a.name <=> b.name}
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear

  end



end
