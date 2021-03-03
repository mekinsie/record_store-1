class Album
  attr_reader :id
  attr_accessor :name, :genre, :year, :artist
  
  @@albums = {}
  @@total_rows = 0

  def initialize(name, year, artist, genre, id )
    @name = name
    @year = year
    @artist = artist
    @genre = genre
    @id = id || @@total_rows += 1
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.year, self.artist, self.genre, self.id)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@albums.delete(self.id)
  end

  def self.search(string)
    our_hash = @@albums.select { |k, v| string.downcase == @@albums[k].name.downcase }
    our_hash.values
  end 

end

