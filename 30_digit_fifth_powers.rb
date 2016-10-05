n = 9
sum = 0
n = 1
while 10**(n+1) < 9**5* n
  n += 1
end
puts n
total = 0
bound = 10**(n+1)
(2..bound).each do |n|
  x = n
  sum = 0
  while x!=0
    sum = sum + (x%10)**5
    x = x/10
  end
  if sum == n
    puts n
    total += sum
  end
end

puts total

