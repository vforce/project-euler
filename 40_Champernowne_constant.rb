s = ''
k = 1
i = 1
result = 1
while s.size<k && k<1000000
  s += i.to_s
  i += 1
  if s.size>=k
    result *= s[k-1].to_i
    k *= 10
  end
end
puts result
