$sum = 0
$primes = [2,3,5,7,11,13,17]
def gen(n, seen, a)
  if n==10
    (1..7).each do |i|
      x = a.to_s.chars.slice(i, 3).join.to_i
      y = $primes[i-1]
      return if x%y!=0
    end
    $sum += a
  else
    if n<=3 || (n>3 && a % $primes[n-3]==0)
      if n==0
        digits = (1..9)
      else
        digits = (0..9)
      end
      digits.each do |d|
        if !seen[d]
          seen[d] = true
          gen(n+1, seen, a*10+d) 
          seen[d] = false
        end
      end
    end
  end
end

gen(0, Hash.new(false), 0)
puts $sum
