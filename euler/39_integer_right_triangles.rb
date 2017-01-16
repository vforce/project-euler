n = 1000
count_max = 0
p_max = 0
n.downto(n/2).each do |p|
  count = 0
  (p/2).downto(Math.sqrt(p)).each do |c|
    (c-1).downto(c/2+1).each do |b|
      a = p - b - c
      if a**2+b**2==c**2
        count += 1 
      end
    end
  end
  if count > count_max
    count_max = count
    p_max = p
  end
end

puts p_max
