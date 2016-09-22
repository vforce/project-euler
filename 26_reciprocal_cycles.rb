def get_precisions(y)
  m = []
  x = 1
  c = 0
  count = 0
  found = false
  while c<1000
    count = 0
    while x/y==0 and count < 10
      x *= 10
      count += 1
      if count == 10
        found = true
        break
      end
    end
    if found
      break
    end
    m << x/y
    x = x%y
    c += 1
  end
  m.join
end
x = get_precisions(7)
def find_cycle(x)
  i=0
  n = x.size
  max_cycle = 100
  cycle = ''
  while i<n/3
    (n/3).downto(1).each do |j|
      tmp1 = x.slice(i, j)
      tmp2 = x.slice(i+j, j)
      tmp3 = x.slice(i+2*j, j)
      if tmp1==tmp2 and tmp1==tmp3
        if max_cycle > j and max_cycle > 1
          max_cycle = j
          cycle = tmp1
        end
      end
    end
    i+=1
  end
  if max_cycle==100
    '' 
  else
    cycle 
  end
end


max_cycle = 0
max_n = 0
(11..999).each do |n|
  y = get_precisions(n)
  x = find_cycle(y)
#  puts "#{n} #{y} #{x} #{x.size}"
  if max_cycle<x.size
    max_cycle = x.size
    max_n = n
    #puts "#{n} #{x}"
  end
end
puts "#{max_n} #{max_cycle}"
