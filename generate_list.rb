filename = 'Words/Words/en.txt'

File.open("hangman_word_list.txt", "w") do |file|
  File.open(filename).each_line do |line|
    word = line.chomp
    if (6..10).include?(word.length)
      file.write line
    end
  end
end
