require_relative 'song_reader'

FILENAME = ARGV[0]
OLD_WORD = ARGV[1]
NEW_WORD = ARGV[2]


def change_words
  contents = SongReader.new(FILENAME).read.downcase.gsub("#{OLD_WORD}", "#{NEW_WORD}")
  File.open(FILENAME, "w") do |file|
    file << contents
  end
end

change_words
