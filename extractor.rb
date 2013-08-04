#!/usr/bin/ruby

filename="TechnischeKenntnisseA.txt"

data = File.read(filename)

while data =~ /\n/
  data = data.gsub(/\n/,"")
end



qna_pattern = Regexp.new("([A-Z]{2}[0-9]{3,4}.+?)(A .+?)B ",Regexp::MULTILINE)


file_out = File.open("#{filename}.tab.txt", 'w')

counter = 0
while data =~ qna_pattern
  counter += 1
  question = $1
  answer = $2
#  puts "Q(#{counter}): #{question}"
#  puts "A: #{answer}"
  file_out.write("#{question}\t#{answer}\n")
  data = data.sub(qna_pattern ,"")
end

file_out.close