#!/usr/bin/env ruby

def choose_word file
  File.readlines(file).sample
end

def get_guess guessed_array
  print "Guess a letter or a word: "
  guess = gets.chomp
  if valid_guess(guess, guessed_array)
    return guess
  else
    puts "Invalid input."
    get_guess(guessed_array)
  end
end

def valid_guess guess, guessed_array
  if not guess.match(/^[[:alpha:]]+$/) 
    puts "Sorry, please enter only characters a to z."
    return false
  elsif guessed_array.include? guess
    puts "You already guessed that! Try again."
    return false
  else
    return true
  end
end

def print_word guessed_array, word
  display_word = ""
  secret_word.each_char do |c|
    if guessed_array.include? c
      display_word += c
    else
      display_word += _
    end
end

wordfile = '1000words.txt'

secret_word = choose_word wordfile

guessed_array = ["a","b","c","d","e","f","g","h","i","j","k"]

get_guess(guessed_array)

print_word(guessed_array, "secret")
