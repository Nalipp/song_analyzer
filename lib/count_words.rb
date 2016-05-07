require_relative 'song_reader'

FILENAME = ARGV[0]
WORD_TO_COUNT = ARGV[1]

def count_words
  contents = SongReader.new(FILENAME).read.gsub(/[^a-z0-9\s]/i, ' ').downcase.gsub("\n", ' ').split(' ')
  count = contents.select { |word| word if word == WORD_TO_COUNT}.length
  puts "The word '#{WORD_TO_COUNT}' appears #{count} times in the text."
end

count_words
