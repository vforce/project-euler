n = 1000
cross_limit = Math.sqrt(n).floor
sieve_bound = n/2-1
sieve = Array.new(sieve_bound, true)
(1..cross_limit).each do |k|
  if sieve[k]
    t = 2*k*(k+1)
    i = t
    while t<sieve_bound
      sieve[t] = false
      t = t + 2*k + 1
    end
  end
end

primes = {2 => true}
sieve.each_with_index do |v, i|
  if v and i>0
    primes[2*i+1] = true
  end
end

numbers = []
(2,3,5,7,9).each do |k|
  last = numbers.shift
  if last.nil?
    last << k
  else
    m = last
    while m>0
      break if !primes[m]
      m = m/10
    end
    next if m > 0
    m = last
    while m > 0
      break if !primes[m]
      m = m.chars.shift.to_i
    end
  end
end
