n = 10000
sieve_bound = n/2-1
cross_limit = Math.sqrt(n).floor
sieve = Array.new(sieve_bound, false)
(1..cross_limit).each do |i|
  if !sieve[i]
    j = 2*i*(i+1)
    while j<sieve_bound
      sieve[j] = true
      j += 2*i+1
    end
  end
end

sieve.each_with_index do |v, i|
  if !v
    puts 2*i+1
  end
end
