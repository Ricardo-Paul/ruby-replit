class WordIndex
  
  def initialize
    @index = Hash.new
  end

  def index(anObject, *phrases)
    phrases.each do |phrase|
      puts "phrases received, #{phrase}"
      phrase.scan(/\w[-\w']+/) do |aWord|
        aWord.downcase!
        puts "matches index : #{aWord}"
        @index[aWord] = [] if @index[aWord].nil?
        @index[aWord].push(anObject)
      end
    end
  end

  def lookup(aWord)
    @index[aWord.downcase!]
  end

  def indexed_words
    @index
  end
  
end