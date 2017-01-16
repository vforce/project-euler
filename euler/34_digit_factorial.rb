factorials = Array.new(10, 1)
(1..9).each do |i|
  factorials[i] = i*factorials[i-1]
end

result = 0
(3..5*10**6).each do |n|
  #puts n
  if n==n.to_s.chars.inject(0) {|memo, c| memo + factorials[c.to_i]}
    puts n
    result += n 
  end
end

puts result
