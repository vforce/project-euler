require 'pp' 
$n = 20
a = Array.new()
(1..$n+1).each do |k|
  a.push(Array.new($n+1, 0))
end
a[1][1] = 2
a[1][0] = a[0][1] = 1
a[2][0] = 1
(2..$n).each do |i|
  (0..i).each do |j|
    if j==0
      a[i][j] = 1
    elsif i==j
      a[i][i] = 2*a[i][i-1]
    else
      a[i][j] = a[i-1][j] + a[i][j-1]
    end
  end
end
puts a[$n][$n]

