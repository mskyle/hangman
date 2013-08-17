#!/usr/bin/env ruby

def choose_word file
  File.readlines(file).sample
end

def get_guess 
  print "Guess a letter or a word: "
  guess = gets.chomp
  if valid_guess guess
    return guess
  else
    puts "Invalid input."
    get_guess 
  end
end

def valid_guess
  # checks to see whether
    # guess includes non-letter characters
      # if it includes non-letter characters, gives error message ("Sorry, guesses should be letters only!") and re-requests guess
    # guess has already been guessed
      # if already guessed, gives error message ("You already guessed that!") and re-requests guess
    # guess is a letter or a word
      # if letter, returns :letter
      # if word, returns :word
end

wordfile = '1000words.txt'

secret_word = choose_word wordfile

