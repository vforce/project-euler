n = 1000000
a = Array.new(n+1, 1)
(2..n/2).each do |i|
  (2..n/i).each do |j|
    a[j*i] = a[j*i] + i
  end
end
num_count = 0
seen = {}
(2..n).each do |k|
  if k==a[a[k]] and k!=a[k] and seen[k].nil?
    puts "#{k}, #{a[k]}"
    seen[k] = seen[a[k]] = true
    num_count += (k+a[k])
  end
end

puts num_count
