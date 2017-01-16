is_pentagons = Hash.new(false)
i = 0
while true
  i += 1
  a = i*(3*i-1)/2
  is_pentagons[a] = true
  next if i==1
  t = i-1
  while t>=1
    b = t*(3*t-1)/2
    if !is_pentagons[a-b]
      t -= 1
      next
    end
    j = i+1
    x = j*(3*j-1)/2 
    while x<a+b
      j += 1
      x = j*(3*j-1)/2 
    end
    if x==a+b 
      puts a-b
      exit
    end
    t -= 1
  end
end
