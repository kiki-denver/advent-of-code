POLICY_MATCHER = /(?<minimum>\d+)-(?<maximum>\d+) (?<char>\w): (?<password>\w+)/.freeze
LINES = INPUT.split("\n").map { |line| line.match(POLICY_MATCHER) }

def valid_by_count?(line)
  count = line[:password].count(line[:char])
  count >= line[:minimum].to_i && count <= line[:maximum].to_i
end

puts "The number of valid passwords is:",
  (LINES.count { |line| valid_by_count?(line) }),
  "\n"

def valid_by_position?(line)
  (line[:password][line[:minimum].to_i - 1] == line[:char]) ^
    (line[:password][line[:maximum].to_i - 1] == line[:char])
end

puts "The number of valid passwords with the new interpretation is:",
  (LINES.count { |line| valid_by_position?(line) })
