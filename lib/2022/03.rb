RUCKSACKS = INPUT.split("\n").map { |rucksack| rucksack.chars }.freeze

PRIORITY = {}
[*'a'..'z', *'A'..'Z'].zip([*1..26, *27..52]).each { |(letter, val)| PRIORITY[letter] = val }
# [['a', 1], ...]

def find_misplaced_item_priority(first_compartment, second_compartment)
  first_compartment.map do |item|
    return PRIORITY[item] if second_compartment.include?(item)
  end

  return 0
end

def misplaced_items_priorities_sum
  RUCKSACKS.map do |chars|
    compartments = chars.each_slice( (chars.size / 2.0).round )
    find_misplaced_item_priority(*compartments)
  end.sum
end

def group_badge_priorities_sum
  RUCKSACKS.map.with_index do |rucksack, i|
    do_stuff(rucksack, i)
  end.sum
end

def do_stuff(rucksack, i)
  if i % 3 == 0
    rucksack.each do |item|
      return PRIORITY[item] if RUCKSACKS[i+1].include?(item) && RUCKSACKS[i+2].include?(item)
    end
  end

  return 0
end

solve!(
  "The sum of the misplaced items priorities across all rucksacks is:",
  misplaced_items_priorities_sum,
)

solve!(
  "The sum of the group badge priorities is:",
  group_badge_priorities_sum
)



