max_cycle_length = 0
max_number = 0
999.downto(11).each do |n|
  if max_cycle_length > n
    break
  end
  value = 1
  seen = {}
  position = 0
  while seen[value].nil? and value!=0
    seen[value] = position
    value *= 10
    value %= n
    position += 1
  end
  #puts cycle
  if max_cycle_length < position - seen[value]
    max_cycle_length = position - seen[value]
    max_number = n
  end
end
puts max_cycle_length
puts max_number
