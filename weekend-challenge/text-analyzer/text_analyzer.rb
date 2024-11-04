# Read text from a file
def read_text_from_file(filename)
    File.read(filename)
end
  
# Count the number of words in the text
def count_words(text)
text.split.size # Could also use length
end
  
# Count the number of characters in the text
def count_characters(text)
text.length
end
  
# Count the number of paragraphs in the text
def count_paragraphs(text)
text.split(/\n\n+/).size
end
  
# Count the frequency of each word
def word_frequency(text)
    frequencies = Hash.new(0)

    # Use \W+ to split on non-word characters like ',', '!', and '.'
    text.downcase.split(/\W+/).each { |word| 
     frequencies[word] += 1 unless word.empty? # Increment the count if the word is not empty
   } 
    frequencies.sort_by {|_, count| -count}.to_h # Ignore the key, returns the frequency hash in descending order using the negative sign 
  end

# Find the most common word
def most_common_word(frequency)
frequency.max_by { |_, count| count } # Ignore the key, returns the word with the highest count
end
  
# Check if a filename is provided as a command-line argument
if ARGV.empty?
    puts "Please provide a filename as an argument."
    exit
end

filename = ARGV[0] # Get the filename from command-line arguments

# Read the .txt file
text = read_text_from_file(filename)

# Perform text analysis
word_count = count_words(text)
character_count = count_characters(text)
paragraph_count = count_paragraphs(text)
frequency = word_frequency(text)
common_word, common_count = most_common_word(frequency)

# Output results
puts "Word Count: #{word_count}"
puts "Character Count: #{character_count}"
puts "Paragraph Count: #{paragraph_count}"
puts "Most Common Word: '#{common_word}' (#{common_count} times)"

puts "Word Frequency Statistics:"
frequency.each do |word, count|
  puts "#{word}: #{count}"
end

