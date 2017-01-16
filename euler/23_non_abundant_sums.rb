n = 28123
a = Array.new(n, 1)
b = Array.new(n, false)
(2..n/2).each do |i|
  (2..n/i).each do |j|
    a[i*j] += i
  end
end
(12..n/2).each do |i|
  if a[i] > i
    (i..n-i).each do |j|
      if a[j] > j
        b[i+j] =  true
      end
    end
  end
end
sum = 0
b.each_with_index do |v, i|
  if !v
    sum += i
  end
end

puts sum
