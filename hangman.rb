#!/usr/bin/env ruby

def choose_word file
  File.readlines(file).sample.strip
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
  word.each_char do |c|
    if guessed_array.include? c
      display_word += c
    else
      display_word += "_"
    end
  end
  display_word
end

def check_letter word, letter
  if word.include? letter
    x = 0
    word.each_char { |c| x += 1 if c == letter }
    puts "Good guess! My secret word contains #{x} occurrences of the letter #{letter}."
  else
    puts "Sorry, that letter is not in my word."
  end
end

def game file
  turns = 8
  secret_word = choose_word file
  guessed_array = []
  while turns > 0
    puts "You have #{turns} turns left"
    puts "The word is: "
    puts print_word guessed_array, secret_word
    guess = get_guess guessed_array
    guessed_array << guess
    if guess == secret_word
      puts "That's right! You win!"
      break
    elsif guess.length == 1
      check_letter secret_word, guess
    else
      puts "Sorry, that's not the right word."
    end
    if (print_word guessed_array, secret_word) == secret_word
      puts "You win! My word was #{secret_word}"
      break
    end
    turns -= 1
  end
  puts "You lose. My word was #{secret_word}." if turns == 0
end

wordfile = '1000words.txt'

game wordfile