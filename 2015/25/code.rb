INSTRUCTION_MATCHER = /row (?<row>\d+), column (?<column>\d+)/.freeze

instructions = INSTRUCTION_MATCHER.match(INPUT)

row = instructions[:row].to_i
column = instructions[:column].to_i

def generate(num)
  num * 252_533 % 33_554_393
end

def code_for(row, column)
  num = 20_151_125
  r = 1
  c = 1

  loop do
    r, c = r == 1 ? [c + 1, 1] : [r - 1, c + 1]
    num = generate(num)
    break if r == row && c == column
  end

  num
end

puts "The code at #{row}, #{column}:", code_for(row, column)
