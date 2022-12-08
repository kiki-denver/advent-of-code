PAIRS = INPUT.split("\n").map { |row| row.split(",").map { |a| a.split("-").map(&:to_i) }.map { |a| a.first..a.last } }

def overlap?(r1, r2)
  ((r1.begin <= r2.end && r1.end >= r2.begin)) || ((r2.begin <= r1.end && r2.end >= r1.begin))
end

solve!(
  "The number of assignment pairs where one range fully contains the other is:",
  PAIRS.map { |pair| pair[0].cover?(pair[1]) || pair[1].cover?(pair[0]) ? 1 : 0 }.sum,
)

solve!(
  "The number of assignment pairs where one range overlaps with the other is:",
  PAIRS.map { |pair| overlap?(pair[0], pair[1]) ? 1 : 0 }.sum,
)

