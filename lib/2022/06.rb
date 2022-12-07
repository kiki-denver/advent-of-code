input = INPUT.chars.freeze

def find_marker(input, look_back)
  input.each_index do |i|
    message = input.slice(i-(look_back-1), look_back)
    uniq_message = message.uniq
    if i < (look_back - 1)
      next
    elsif message.length != uniq_message.length
      next
    else
      return (i + 1)
    end
  end
end

solve!(
  "The number of characters before start-of-packet marker is:",
  find_marker(input, 4),
)

solve!(
  "The number of characters before start-of-message marker is::",
  find_marker(input, 14),
)
