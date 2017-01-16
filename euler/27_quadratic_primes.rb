n = 1000
$max = 3000000
$sieve_bound = ($max-1)/2
$max_k = Math.sqrt($max) - 1
$primes = Array.new($sieve_bound, true)
(1..$max_k).each do |i|
  if !$primes[i]
    next
  end
  j = 2*i*(i+1)
  while j<$sieve_bound
    $primes[j] = false
    j = j+2*i+1
  end
end

primes = []
$is_prime = {}
$primes.each_index.select{|i| $primes[i]}.map{|i| 2*i+1}.each do |p|
  primes << p
  $is_prime[p] = 1
end

def get_chain_length(a, b)
  result = 0
  chain_length = 0
  m = b.abs
  (0..m).each do |n|
    s = n*n+n*a+b
    if s<2
      return [chain_length, result]
    end
    if $is_prime[n*n+n*a+b]==1
      chain_length += 1
    else
      break
    end
  end
  [chain_length, a*b]
end

result = 0
max_chain_length = 0
primes.each_with_index do |b|
  if b<3
    next
  end
  if b>1000
    break
  end
  (-1000..1000).each do |a|
    (chain_length, product) = get_chain_length(a, b)
    #puts "#{b} #{a} #{chain_length} #{product}"

    if max_chain_length < chain_length 
      max_chain_length = chain_length
      result = product
    end
    (chain_length, product) = get_chain_length(a, -b)
    #puts "#{b}, #{chain_length} #{product}"
    if max_chain_length < chain_length 
      max_chain_length = chain_length
      result = product
    end
  end
end
puts result
