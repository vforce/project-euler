require 'pp'
n = 1000000
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
count = 0
init = false
sum = 0
while count < 11
  last = numbers.shift
  if last.nil?
    [2,3,5,7,9].each do |k|
      numbers << k
    end
    break if init
    init = true
  else
    is_prime_a = false
    is_prime_b = false
    m = last
    while m>0
      break if !primes[m]
      m = m/10
    end
    is_prime_a = true if m==0
    m = last.to_s.chars
    while m.size > 0
      break if !primes[m.join.to_i]
      m.shift 
    end
    is_prime_b = true if m.size==0
    if is_prime_a && is_prime_b and last > 10
      puts last
      sum += last
      count += 1
    end
    [2,3,5,7,9].each do |k|
      numbers <<  last * 10 + k
    end
  end
end
