require_relative 'word_index.rb'
# Transaction style, allows the method to close the file after the block has run
class File
  def File.openAndAcess(*args)
    f = File.open(*args)
    if block_given?
      yield(f)
    end
    f.close
  end
end

class Song
  @@total_play_count = 0
  attr_reader :name, :artist, :duration
  
  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
    # adding a play count
    @play_count = 0
  end

  def to_s
    "Song: #{@name} | #{@artist} | #{@duration}"
  end

  def play
    @play_count += 1
    @@total_play_count += 1
    "#{@name} has been played #{@play_count} times | total : #{@@total_play_count}"
  end
end

class KaraokeSong < Song
  attr_reader :name, :artist, :duration, :lyrics
  attr_writer :lyrics
  
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end

  # def lyrics=(lyrics)
  #   @lyrics = lyrics
  # end

  def to_s
    super + " | #{@lyrics}"
  end
end

# this is like definion our own array, if we need the map method we need 
# to implement our own
class SongList
  attr_reader :songs
  def initialize
    @songs = Array.new
    @index = WordIndex.new
  end
  
  MaxDuration = 5*60 #300 seconds
  def SongList.isTooLong?(aSong)
    return aSong.duration > MaxDuration
  end

  # creating our square_brackets method 
  def [](key)
    if key.kind_of? Integer 
      return @songs[key]
    end
  end

  def append(aSong)
    @songs.push(aSong)
    # index each song appended in our list
    indexSong(aSong, aSong.name, aSong.artist)
    self
  end

  def deleteFirst
    @songs.shift
  end

  def deleteLast
    @songs.pop
  end

  def length
    return @songs.length
  end

  # so we can see which words are in the index
  def index_words
    @index.indexed_words
  end

  private
  def indexSong(*args)
    @index.index(*args)
  end
  
end

class Logger
  private_class_method :new
  @@logger = nil
  def Logger.create
    @@logger = new unless @@logger
    @@logger
  end
end

class Button
  def initialize(label)
    @label = label
  end
end

class JukeboxButton < Button
  def initialize(label, &action)
    super(label)
    @action = action
  end

  def pressButton
    @action.call
  end
end

## ================ Using Classes ===============
lose_yourself = Song.new("Lose Yourself", "Eminem", 120)
# puts lose_yourself.inspect
puts "---String representations--- \n"
puts lose_yourself.to_s

dusk_till_dawn = KaraokeSong.new("Dusk Till Dawn", "Mathias", 430, "how beatiful...")
puts dusk_till_dawn.to_s
# changing the lyrics
dusk_till_dawn.lyrics = "The new lyrics ..."

puts "=== Reading attributes=== "
arr = [dusk_till_dawn.artist, dusk_till_dawn.lyrics] 

arr.each do |element|
  puts "- " + element
end

puts "=== Playing songs ==="
puts dusk_till_dawn.play
puts lose_yourself.play

puts "=== check length of songs==="
puts "#{dusk_till_dawn.name} is too long" if SongList.isTooLong?(dusk_till_dawn)
puts "#{lose_yourself.name} is short" if !SongList.isTooLong?(lose_yourself)

puts Logger.create.object_id
puts Logger.create.object_id

puts "===== Song List ====="
list = SongList.new
list.append(Song.new("Hustling", "Rick Ross", 230))
    .append(dusk_till_dawn)
    .append(lose_yourself)
list.deleteLast
puts "number of songs: #{list.length}"
puts list[1]

jukebox_button = JukeboxButton.new("Start") { puts "Start button pressed" }
puts jukebox_button.pressButton

# ==== Song file =====
File.openAndAcess('songFile.txt') do |f|
  f.each do |line|
    file, duration, artist, title = line.chomp.split(/\s*\|\s*/)
    mins, secs = duration.scan(/\d+/)
    artist.squeeze! #squeeze in place
    list.append Song.new(title, artist, mins.to_i*60+secs.to_i)
  end
end

puts "===== All the songs ====="
print "SONGLIST :", list.length, "\n"
# Each time we try to represent a song as string, it will call the internal to_s method
list.songs.each { |song| puts song }

puts "==== all {word : => song} in the index ===="
puts list.index_words.keys