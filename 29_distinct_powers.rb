require 'pp'
n = 10
seen = Array.new(n+1) {Array.new(n+1, 1)}
s = {}
(2..n).each do |a|
  (2..n).each do |b|
    s[a**b] = 1
  end
end
puts s.size

count = 0
(2..n).each do |a|
  seen[a][0] = seen[a][1] = a
  count += seen[a].inject(0) {|memo, x| memo+x}
  if a<=Math.sqrt(n)
    (2..Math.log(n, a).floor).each do |k|
      (2..n/k).each do |l|
        puts "#{a}, #{k}, #{a**k} #{l}"
        seen[a**k][l] = 0
      end
    end
  end
end

pp seen

# 4^6 = 8^4
# or 2^(2*3) = 2^(2*3)
# when a = 2
# k = 2, then takes for 4, max power is 2^10. but it can go beyond that, because 2^x where x>10 can represent other power. then the question is, how big can l go 
# how to take 8^4? 8^4 = 2^6
# a = 2, k = 3, then how big is l? (2..10/3)

puts count
# 2**4 = 4**2
# 4**3 = 2**6
# if a = 2, a**2 = 4, then the max power of 4 that can be seen by 2 is (2^2)^x = 2^(2*x) and 2*x<100 => x<50
# for each a, a**k, the the max power of a**k that can be seen by 2 is 100/k
# if b = a*a => for all b^x, mark for a^2x
# if b = a*a*a => for all b^x, mark for a^3x
# and so on
# (2..Math.log(n, a).floor).each do |k|
#   
# end

#(2..n).each do |a|
# count 
#end
