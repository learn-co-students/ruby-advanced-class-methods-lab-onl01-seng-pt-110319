class Song
attr_accessor :name, :artist_name
@@all=[]

  def self.all
    @@all
  end

  def save
    self.class.all<<self
  end

  def self.create
    song=self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song=self.new
    song.name=song_name
    song
  end

  def self.create_by_name(song_name)
    song=self.create
    song.name=song_name
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name==name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(data)
    parse_data=data.split(" - ")
    artist_name=parse_data[0]
    song_name=parse_data[1].gsub(".mp3","")
    song=self.create_by_name(song_name)
    song.artist_name=artist_name
    song
  end

  def self.create_from_filename(data)
      self.new_from_filename(data)
  end

  def self.destroy_all
    self.all.clear
  end

end
