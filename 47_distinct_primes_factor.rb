n = 10000000
limit = Math.sqrt(n).floor
bound = n/2-1
sieve = Array.new(bound, true)
(1..limit).each do |k|
  if sieve[k]
    p = 2*k*(k+1)
    while p<bound
      sieve[p] = false
      p += 2*k+1
    end
  end
end

$primes = [2]
is_primes = Hash.new(false)

sieve.each_with_index do |v, i|
  if v && i>0
    $primes << i*2+1
    is_primes[i*2+1] = true
  end
end

$factors = Hash.new {|hash, key| hash[key] = Hash.new(0)}
$factors[1] = 1

def prime_factor(n)
  limit = n/2
  m = n
  $primes.each do |k|
    break if k>limit
    if m%k==0
      $factors[m].merge!($factors[m/k])
      if $factors[m/k][k].nil?
        $factors[m][k] = 1
      else
        $factors[m][k] += 1
      end
      return $factors[m].size
    end
  end
end

n = 1
while true
  n += 1
  if is_primes[n]
    $factors[n] = {n => 1}
    next
  end
  if prime_factor(n) == 4 &&
    prime_factor(n+1) == 4 && 
    prime_factor(n+2) ==4 && 
    prime_factor(n+3) == 4
    puts n
    exit
  end
end
