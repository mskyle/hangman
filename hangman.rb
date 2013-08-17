#!/usr/bin/env ruby

def choose_word file
  File.readlines(file).sample
end


wordfile = '1000words.txt'

secret_word = choose_word wordfile

puts secret_word