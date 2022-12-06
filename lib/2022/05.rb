input = INPUT.split("\n")
MOVES = input.select { |l| l[0] == "m" }.map { |l| l.scan(/\d+/).map(&:to_i) }.freeze

CRATES = []
# first element is the top of the stack
input.take_while { |line| line[1].to_i != 1 }.map do |l|
  x = 0
  l.chars.each_slice(4) do |a|
    if a[1] != ' '
      CRATES[x] = ( CRATES[x] ||= [] ) << a[1]
    end
    x = x + 1
  end
end
CRATES.freeze

def rearrange_crates_one_at_a_time(crates)
  MOVES.each do |m|
    x = 0
    while x < m[0]
      crates[m[2] - 1] = crates[m[2] - 1].unshift( crates[m[1] - 1].shift )
      x = x + 1
    end
  end
end

def rearrange_crates_groups_at_a_time(crates)
  MOVES.each do |m|
    crates[m[2] - 1] = crates[m[2] - 1].unshift(crates[m[1] - 1].shift(m[0])).flatten
  end
end

def top_of_stacks(crates, arrangement)
  arrangement.call(crates)
  crates.map(&:first).join
end


solve!(
  "what crate ends up on top of each stack after the one at a time rearrangement procedure completes:",
  top_of_stacks(CRATES.map(&:dup), method(:rearrange_crates_one_at_a_time))
)

solve!(
  "what crate ends up on top of each stack after the groups at a time rearrangement procedure completes:",
  top_of_stacks(CRATES.map(&:dup), method(:rearrange_crates_groups_at_a_time))
)
