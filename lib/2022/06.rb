input = INPUT.chars.freeze

def find_marker(input, look_back)
  input.each_index do |i|
    message = input.slice(i - (look_back - 1), look_back)
    uniq_message = message.uniq
    return (i + 1) unless i < (look_back - 1) || message.length != uniq_message.length
  end

  return 0
end

solve!(
  "The number of characters before start-of-packet marker is:",
  find_marker(input, 4),
)

solve!(
  "The number of characters before start-of-message marker is::",
  find_marker(input, 14),
)
