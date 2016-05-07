require_relative 'song_reader'

FILENAME = ARGV[0]
TOP_WORDS = ARGV[1]

def word_frequency(top_words)
  contents = SongReader.new(FILENAME).read
  word_array = contents.gsub("\n", " ").gsub(/\W/, ' ').split(' ')
  words_hash = word_array.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
  top_words_array = words_hash.sort_by { |k,v| v}.last(top_words.to_i)
  print_word_frequency(top_words_array)
end

def print_word_frequency(top_words_array)
  puts "The #{TOP_WORDS} most frequent words in the song are... "
  top_words_array.each { |k,v| puts "#{k} : #{v}"}
end

word_frequency(TOP_WORDS)
