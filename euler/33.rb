denominator = 1
numerator = 1
(11..98).each do |a|
  (a+1..99).each do |b|
    if a%10==0 and b%10==0
      next
    end
    x = a / 10
    y = a % 10
    z = b / 10
    t = b % 10
    if x == z && a * t == b * y  ||
      x == t && a * z == b * y || 
      y == z && a * t == b * x || 
      y == t && a * z == b * x
      puts "#{a}/#{b}"
      numerator *= a
      denominator *= b
    end
  end
end
puts denominator / numerator.gcd(denominator)
