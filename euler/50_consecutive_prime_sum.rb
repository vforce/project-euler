n = 10**6
limit = Math.sqrt(n).floor/2
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

primes = [2]
is_primes = {2=>2}
sieve.each_with_index do |v,i|
  if v and i>0
    primes << 2*i+1
    is_primes[2*i+1] = true
  end
end
puts "sieve size: #{sieve.size}"
puts primes.size
upper_bound_index = 0
primes.each_with_index do |p, i|
 if i>0 && primes[i]>n/2 && primes[i-1]>n/2
   upper_bound_index = i
 end
end
puts upper_bound_index
puts primes[upper_bound_index]
sum = []
max_sum = 0
max_count = 0
sum << [2]
i = 1
while i<primes.size
  if i>1
    sum = [sum[1]]
  end
  sum << Array.new(i)
  j = i
  while j>=0 
    tmp = sum[1][j] = primes[i] + (sum[0][j].nil? ? 0 : sum[0][j])
    count = i-j
    if tmp<n && is_primes[tmp] && i-j>max_count
      max_count = count
      max_sum = tmp 
    end
    break if tmp>n
    j -= 1
  end
  i += 1
end

puts max_sum
puts max_count
