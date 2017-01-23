require 'pp'
a = []
n = 10
b = []
(1..n*n).each do |i|
  b << i
  if i%n==0
    a << b
    b = []
  end
end
(0..n-1).each do |i|
  tmp = a[i][i]
  a[i][i] = a[i][n-i-1]
  a[i][n-i-1] = tmp
end

