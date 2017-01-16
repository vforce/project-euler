t = 286
p = 166
h = 144

def triple(t)
  t*(t+1)/2
end

def penta(t)
  t*(3*t-1)/2
end

def hexa(t)
  t*(2*t-1)
end
z = hexa(h)
while true
  x = triple(t)
  while x<z
    t += 1
    x = triple(t)
  end
  y = penta(p)
  while y<x
    p += 1
    y = penta(p)
  end
  z = hexa(h)
  while z<y
    h+=1
    z = hexa(h)
  end
  if x==y && x==z
    puts x
    exit
  end
  puts "#{x}, #{y}, #{z}"
end
