sum = 0
(1..1000).each do |n|
  next if n%10==0
  sum += n**n
end
p sum.to_s.slice(sum.to_s.size-10, 10)

