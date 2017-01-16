n = 10000000
cross_limit = Math.sqrt(n).floor
sieve_bound = n/2-1
sieve = Array.new(sieve_bound, true)
(1..cross_limit).each do |k|
  if sieve[k]
    t = 2*k*(k+1)
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
count = 11
sum = 0
while count > 0
  if numbers.size==0
    [2,3,5,7,9].each do |k|
      numbers << k
    end
  else
    n = numbers.shift
    m = n
    prime_right = prime_left = false
    while n > 0
      break if primes[n].nil?
      n /= 10
    end
    prime_right = true if n==0
    n = m.to_s.chars
    while n.size>0
      break if primes[n.join.to_i].nil?
      n.shift
    end
    prime_left = true if n.size==0
    if prime_left && prime_right && m>10
      count -= 1
      sum += m
      puts m
    end
    [1, 3,7,9].each do |k|
      numbers << m*10+k
    end
  end
end
puts sum
