seen = {}
n = 100

(2..n).each do |a|
  (2..n).each do |b|
    x = a**b
    if seen[x].nil?
      seen[x] = 1
    else
      seen[x] += 1
    end
  end
end

puts seen.select {|key| seen[key]!=1}
