#!/usr/bin/ruby

filename="source.txt"

data = File.read(filename)

qna_pattern = Regexp.new("([A-Z] [A-Z] [A-Z])\n.*?\n.*?\n(.*?)\n.*?\n.*?\n(.*?)\n",Regexp::MULTILINE)


file_out = File.open("#{filename}.tab.txt", 'w')

counter = 0
while data =~ qna_pattern
  counter += 1
  question = $1
  answer1 = $2
  answer2 = $3
  puts "Q(#{counter}): #{question}"
  puts "A1: #{answer1}"
  puts "A2: #{answer2}"
  file_out.write("#{question} ?\t#{answer1}\n")
  file_out.write("#{question}\t#{answer2}\n")
  data = data.sub(qna_pattern ,"")
end

file_out.close