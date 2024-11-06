# Sample list of words
words = ["level", "elephant", "ruby", "book", "hello"]

# For Loop
for word in words

    # Is it a palindrome?
    is_palindrome = (word == word.reverse)

    # Does it contain the letter 'e'
    include_e = word.include?("e")

    # Character count
    char_count = word.length

    # Replace ruby with Python
    replacement = word.gsub("ruby", "Python")
    
    puts " 
    Word: #{word}
     - Palindrome: #{is_palindrome ? 'Yes' : 'No'}
     - Contains 'e': #{include_e ? 'Yes' : 'No'}
     - Character Count: #{char_count}
     - After Replacement: #{replacement}
     " 
end



# Anagram Checker
# Check whether any two words in the list are anagrams of each other. 
words = ["listen", "silent", "heart", "earth", "ruby", "Python"]

# Convert all words to lowercase 
# .map(&:method_name) applies the block of code, in this case, downcase method, to the whole array
words.map!(&:downcase)

word_count = {}

# Count characters for each word (.each iterator)
words.each do |word|
  character_counts = Hash.new(0)  # Initialize a hash with default value 0
  
  #Loop through each character
  word.chars.each do |char| # .chars splits a string into an array of individual characters
    character_counts[char] += 1  # Count each character
  end
  # Stores the counting character for each word
  word_count[word] = character_counts
end

anagrams = []

# Find anagrams
for word in words
  for compare_word in words
    next if compare_word == word  # Skip the same word
    if word_count[word] == word_count[compare_word]
        # Ensure the pair is stored in a consistent order
        pair = [word, compare_word].sort
        anagrams << pair # add the pair to anagrams array
    end
  end
end

# Remove duplicates and keep unique pairs
anagrams.uniq!

puts "Anagram Pairs:"
anagrams.each do |pair|
    puts "\"#{pair[0]}\" and \"#{pair[1]}\""
end

<<<<<<< HEAD
=======


>>>>>>> d4782a6 (Initial commit after re-initializing git)
