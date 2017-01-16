n = 1000000
limit = Math.sqrt(n).floor
sieve_bound=n/2-1
sieve = Array.new(sieve_bound, true)
(1..limit).each do |k|
  if sieve[k]
    p = 2*k*(k+1)
    while p<sieve_bound
      sieve[p] = false
      p += 2*k+1
    end
  end
end

primes = [2]
sieve.each_with_index do |v, i|
  if v && i>0
    primes << 2*i+1
  end
end

n = 35
while true
  i = 0
  correct = false
  while primes[i]<n
    a = Math.sqrt((n-primes[i])/2).floor
    if a*a*2 == (n-primes[i])
      correct = true
      break
    else
      i += 1
    end
  end
  if correct || primes[i]==n
    n += 2
  else
    p n
    exit
  end
end
