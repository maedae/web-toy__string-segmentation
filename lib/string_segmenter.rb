require_relative 'dictionary'

class Segment
	def initialize(str)
		@str = str
		@words = []
		@word_index = Hash.new(0)
		@first_letter = 0
		@last_letter = 0
	end

	def available_words()
	  working_dictionary = ["cat", "cats","running", "run", "trance", "publish", "pub"]
	  return working_dictionary.join(" ")
	end

	def testing ()
		return "test"
	end

	def final_words
		while @last_letter <= @str.length do  
	    if danglers?
	      @last_letter = index_of_most_recently_found_word + 1

	      @words.delete(most_recently_found_word)

	      @word_index.delete(most_recently_found_word)

	      @first_letter = index_of_most_recently_found_word + 1 

	    elsif !valid_word?(part_of_word)
	      @last_letter += 1

	    else
	    	store_valid_word(part_of_word)

	      @first_letter = @last_letter + 1
	      @last_letter += 1
	    end
	  end

  	return @words.join(" ")
	end

	# Get a segment of the full string based on a starting and ending point.
	# 
	# Returns String.
	def part_of_word
		@str[@first_letter..@last_letter]
	end

	# Adds a word into the running collection.
	# 
	# Returns True (not that it matters).
	def store_valid_word(word)
		@words << word
		@word_index[word] = @last_letter
	end

	# Checks if there are danglers at the end of the string.
	# 
	# str - Entire String that's being segmented.
	# first_letter - Integer index of the first letter from str that'll begin the section of str that's being checked.
	# last_letter - Integer index of last letter from str.
	# words - Array with words that have been identified so far.
	# 
	# Returns Boolean.
	def danglers?
	  !valid_word?(@str[@first_letter..@last_letter]) && @last_letter == @str.length && @words.join.length < @str.length
	end

	# Get the list of words that have been found so far.
	# 
	# words_with_their_index - Hash with word as key and its position as value.
	# 
	# Returns Array of words.
	def found_words
	  @word_index.keys
	end

	# Get position of most recently found word.
	# 
	# words_with_their_index - Hash with word as key and its position as value.
	# 
	# Returns Integer.
	def index_of_most_recently_found_word
	  if @word_index.values.max == nil
	  	return -1
	  else
	  	return @word_index.values.max
	  end
	end

	# Get the most recently added word.
	# 
	# words_with_their_index - Hash with word as key and its position as value.
	# 
	# Returns the word as a String.
	def most_recently_found_word
	  i = index_of_most_recently_found_word
	  @word_index.key(i)
	end
end