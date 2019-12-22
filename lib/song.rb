require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def save
    self.class.all << self
  end
  @@all

  def self.new_by_name(title)
    song = self.create
    song.name = title
    song
end

def self.create_by_name(name)
  song = self.create
  song.name = name
  song
end

  def self.find_by_name(name)
    @@all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    end

  def self.alphabetical
      self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
      song = self.new
      title = filename.gsub(/\w+[^-]\z/, "")
      song.artist_name = title.scan(/\w+[^-]/)[0].strip
      song.name = title.scan(/\w+[^-]+\w+[^.]/)[1]
      song
    end

   def self.create_from_filename(filename)
     song = self.create
     title = filename.gsub(/\w+[^-]\z/, "")
     song.artist_name = title.scan(/\w+[^-]/)[0].strip
     song.name = title.scan(/\w+[^-]+\w+[^.]/)[1]
     song
   end

   def self.destroy_all
  self.all.clear
end

end
