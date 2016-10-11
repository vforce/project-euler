$sum = 0
$primes = [2,3,5,7,11,13,17]
def gen(n, seen, a)
  if n==10
    if (a%1000 % 17)==0
      $sum += a
    end
  else
    if n<=3 || (n>3 && ((a%1000) % $primes[n-4])==0)
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
