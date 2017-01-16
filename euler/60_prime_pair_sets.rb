require 'pp'
n = 10**8
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

$primes = []
$is_prime = Hash.new(false)
sieve.each_with_index do |v, i|
  if v && i>0
   $primes << 2*i+1 
   $is_prime[2*i+1] = true
  end
end

$store = Hash.new {|h, k| h[k] = Array.new}
$primes.each do |p|
  p = p.to_s
  (1..p.size-1).each do |i|
    a = p.slice(0, i)
    b = p.slice(i, p.size)
    next if b.start_with?('0')
    next if !$is_prime[(b+a).to_i]
    a = a.to_i
    b = b.to_i
    if a>b
      a,b = b,a 
    end
    if $is_prime[a] && $is_prime[b]  && !$store[a].include?(b)
      $store[a] << b 
    end
  end
end
$sorted_keys = $store.keys.sort
$sorted_keys.each do |k|
  $store[k].sort! 
end

$min_sum = 999999

def track(key, i, sum, values, pool)
  return if pool.size==0
  if i==3
    sum = sum + pool[0]
    if sum < $min_sum
      $min_sum = sum
      exit
    end
    return
  end
  pool.each do |v|
    if sum+v<$min_sum 
      track(v, i+1, sum+v, values + [v], pool & $store[v])
    end
  end
end

$sorted_keys.each do |key|
  if $store[key].size>5 
    track(key, 0, key, [key], $store[key])  
  end
end

p $min_sum
