# Text Analyzer

## Description

This Ruby program analyzes a text document, counting the number of words, characters, and paragraphs. It also identifies the most common word used in the document and provides word frequency statistics.

## Features

**Word Count**: Counts the total number of words in the document.
**Character Count**: Counts the total number of characters in the document.
**Paragraph Count**: Counts the number of paragraphs, defined by double newlines.
**Word Frequency**: Provides a frequency count of each word, ignoring case and punctuation.
**Most Common Word**: Identifies the word that appears most frequently in the text.
**Command-Line Input**: Accepts the filename as a command-line argument.

## Usage
To run the program, use the following command in your terminal:

```
ruby text_analyzer.rb <filename> 
```
Replace `<filename>` with the path to your text file. For example:
```
ruby text_analyzer.rb sample.txt
```

## Refactoring Choices

### Modular Design
Each analysis (counting words, characters, paragraphs, and word frequencies) is encapsulated in its own function. This structure is simple and improves readability which allows for easier debugging and testing.

### Efficient Frequency Counting
The `word_frequency` method uses `Hash.new(0)` to initialize the frequency count, allowing for straightforward incrementing without checking if the key exists.

### Regular Expressions for Splitting
The program uses `split(/\W+/)`  to effectively handle punctuation (e.g. ',','!','.') ensuring accurate word counting. In addition, the program uses `split(\n\n+)` to effectively new lines ensuring accurate paragraph counting. This approach allows for clean separation of words and paragraphs.

### Sorting Frequencies
The `word_frequency` method sorts the frequencies by count in descending order, returning a sorted hash that makes it easy to identify the most common words at the beginning.

### Command-Line Argument Handling
The program uses `ARGV` to accept the filename as an input argument, enhancing flexibility with diffferent text files. It checks if an argument is provided and gives a user-friendly message if not.

## Additional Features

- **Case Insensitivity**: The program converts all text to lowercase to ensure accurate counting of word frequencies without case sensitivity issues.

