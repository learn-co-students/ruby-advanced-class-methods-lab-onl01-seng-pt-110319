








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
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
   # @@all << song
    song
  end
  
  def self.find_by_name(name)
    song = self.all.find{|song| song.name == name}
    song
  end
  
  def self.find_or_create_by_name(name)
    if !find_by_name(name)
          create_by_name(name)
    else find_by_name(name)
    end
  end
  
  def self.alphabetical
    song = self.all.sort_by{|song| song.name}
  end
     
  def self.new_from_filename(filename)
    filetype = filename.sub!(/.mp3/,"").split(" - ")
      song = self.new
      song.name = song
      song.artist_name = filetype[0]
      song.name = filetype[1]
    song
  end
  
  def self.create_from_filename(filename)
    filetype = filename.sub!(/.mp3/,"").split(" - ")
      song = self.new
      song.name = song
      song.artist_name = filetype[0]
      song.name = filetype[1]
      song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  

end
