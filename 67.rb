a = Array.new
File.open('p067_triangle.txt', 'r') do |f|
  f.each_line do |line|
    a << line.strip.split(' ').map {|x| x.to_i} 
  end
end
n = a.size
b = Array.new(n){Array.new(n, 0)}
b[0][0] = a[0][0]
(1..n-1).each do |i|
  (0..i).each do |j|
      x = (j==0) ? 0 : b[i-1][j-1]
      #puts "#{i} #{j}"
      #puts a[i][j]
      b[i][j] = a[i][j] + [b[i-1][j], x].max
  end
end
puts b[n-1].max
