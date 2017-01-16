a = 1
b = 1
count = 2
while b.to_s.size<1000
  a, b = b, a+b
  count +=1
end
puts count
