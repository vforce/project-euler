n = 1001
t_max = (n+1)/2
x = 3
t = 1
s = 1
while t < t_max
  s = s + 4*(x+3*t)
  x = x+8*t+2
  t += 1
end
puts s
