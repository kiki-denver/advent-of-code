RUCKSACKS = INPUT.split("\n").map { |rucksack| rucksack.chars }.freeze

PRIORITY = {}
[*'a'..'z', *'A'..'Z'].zip([*1..26, *27..52]).each { |y| PRIORITY[y[0]] = y[1] }

solve!(
  "The sum of the misplaced items priorities across all rucksacks is:",
  RUCKSACKS.map {|rucksack| rucksack.each_slice( (rucksack.size/2.0).round ).to_a}.map {
    |rucksack_1, rucksack_2 | rucksack_1.map {
      |item| break PRIORITY[item] if rucksack_2.include?item
    }
  }.sum
)

solve!(
  "The sum of the group badge priorities is:",
  RUCKSACKS.map.with_index { |rucksack, i|
    if (i % 3 == 0)
      rucksack.map {
        |item| break PRIORITY[item] if (RUCKSACKS[i+1].include?(item) && RUCKSACKS[i+2].include?(item))
        }
    else
      0
    end
  }.sum
)



