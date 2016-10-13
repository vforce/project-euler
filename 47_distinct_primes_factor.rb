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

def prime_factor(n)
  factor_count = 0
  limit = n/2
  $primes.each do |k|
    break if k>limit
    if n%k==0
      factor_count += 1
      while n%k==0
        n /= k
      end
    end
  end
  factor_count
end

$factor_count = Hash.new(0)
def get_factor_count(n)
  return $factor_count[n] if $factor_count[n]>0
  return $factor_count[n] = prime_factor(n)
end


n = 209
while true
  n += 1
  next if is_primes[n]
  if get_factor_count(n) == 4 &&
    get_factor_count(n+1) == 4 && 
    get_factor_count(n+2) ==4 && 
    get_factor_count(n+3) == 4
    puts n
    exit
  end
end
