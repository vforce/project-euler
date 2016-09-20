n = 10000
a = Array.new(n+1, 1)
(2..n/2).each do |i|
  (i*2..n).each do |j|
    if j%i==0
      a[j] = a[j] + i
    end
  end
end
num_count = 0
(2..n).each do |k|
  x = a[k]
  y = a[x]
  if x==y and k!=x
    num_count += (x+y)
  end
end

puts num_count
