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
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
   self.all.find {|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
   song = self.find_by_name(name)
     song ||= self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    split_array = filename.split(" - ")
    song_name = split_array[1][0..-5]
    artist_name = split_array[0][0..-1]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
