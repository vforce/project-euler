n = 1000
sieve_bound = Math.sqrt(n).floor
sieve = Array.new(n/2-1, 1)
(1..sieve_bound).each do |t|
  i = 2*t*(t+1)
  while i<n/2-1
    sieve[i] = 0
    i += (2*t+1)
  end
end
sieve.each_with_index do |k, i|
  if k==1 and i>0
    puts 2*i+1
  end
end
