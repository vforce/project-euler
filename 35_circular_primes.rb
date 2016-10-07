n = 10**3
sieve_bound = Math.sqrt(n).floor
max_prime = n/2-1
sieve = Array.new(sieve_bound, 1)
(1..sieve_bound).each do |k|
  i = 2*k*(k+1)
  while i<max_prime
    sieve[i] = 0
    i += 2*k+1
  end
end

sieve.each_with_index do |p, i|
  if p==1 
    puts 2*i+1
  end
end

