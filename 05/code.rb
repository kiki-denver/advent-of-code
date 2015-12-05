def input
  INPUT.split("\n")
end

def nice?(line)
  vowels = line.scan(/[aeiou]/).count >= 3
  double_char = (line =~ /(.)\1+/)
  bad_words = (line =~ /ab|cd|pq|xy/)

  !!(vowels && double_char && !bad_words)
end

def santas_list
  input.partition { |line| nice?(line) }
end

nice, naughty = santas_list

puts "Making a list:"
puts "Nice: #{nice.size}", "Naughty: #{naughty.size}", nil

def nice?(line)
  matching_pairs = (line =~ /(..).*\1/)
  sandwich = (line =~ /(.).\1/)

  !!(matching_pairs && sandwich)
end

nice, naughty = santas_list

puts "Checking it twice:"
puts "Nice: #{nice.size}", "Naughty: #{naughty.size}"
