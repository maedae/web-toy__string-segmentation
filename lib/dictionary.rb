def valid_word?(word)
  # Populate this array with some words of your choosing.
  dictionary = ["cat", "cats","running", "run", "trance", "publish", "pub"]
  dictionary.include?(word)
  # Return true if your dictionary contains `word`
  # or false if it does not.
end

def available_words()
  dictionary = ["cat", "cats","running", "run", "trance", "publish", "pub"]
  return dictionary.join(" ")
end