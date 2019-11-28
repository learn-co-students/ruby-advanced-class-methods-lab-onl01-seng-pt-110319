class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.all
    @@all
  end
  def save
    self.class.all << self
  end
  def self.create
    @song= self.new
    @song.save
    @song
  end
  def self.new_by_name(song_name)
    @song= self.new
    @song.name= song_name
    @song
  end
  def self.create_by_name(song_name)
    @song = self.create
    @song.name = song_name
    @song
  end
  def self.find_by_name(song_name)
    @@all.each do |song|
      if song.name == song_name
        return song
      end
    end
    nil
  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  def self.alphabetical
    song_names=[]
    instances=[]
    @@all.each do |song|
      song_names << song.name
    end
    song_names.sort.each do |names|
      instances << self.find_by_name(names)
    end
    instances
  end
  def self.new_from_filename(filename)
    seperated= filename.split(/\s-\s/)
    artist= seperated[0]
    name_file= seperated[1]
    name_split= name_file.split(/\./)
    name= name_split[0]
    @song= self.new_by_name(name)
    @song.artist_name=artist
    @song
  end
  def self.create_from_filename(filename)
    seperated= filename.split(/\s-\s/)
    artist= seperated[0]
    name_file= seperated[1]
    name_split= name_file.split(/\./)
    name= name_split[0]
    @song= self.create_by_name(name)
    @song.artist_name=artist
    @song
  end
  def self.destroy_all
    @@all.clear
  end
end
