n = 10**6
sieve_bound = n/2-1
cross_limit = Math.sqrt(n).floor
sieve = Array.new(sieve_bound, false)
(1..cross_limit).each do |k|
  if !sieve[k]
    i = 2*k*(k+1)
    while i<sieve_bound
      sieve[i] = true
      i += 2*k+1
    end
  end
end

result = 1
sieve.each_with_index do |v, i|
  if !v and i>0
    p = 2*i+1
    count = p.to_s.chars.size - 1
    p1 = p.to_s
    while count > 0
      p1 = p1.slice(1, p1.size-1) + p1[0]
      if p1.to_i%2==0 || sieve[(p1.to_i-1)/2]
        break
      end
      count -= 1
    end
    if count == 0
      puts p
      result += 1
    end
  end
end

puts "---> #{result}"
