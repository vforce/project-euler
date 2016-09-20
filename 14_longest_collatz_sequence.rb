$chains = {1 => 1}

def chain(n)
  if n==1
    1
  elsif $chains.has_key?(n)
    $chains[n]
  else
    $chains[n] = if n%2==0
            1 + chain(n/2)
          else
            1 + chain(3*n+1)
          end
  end
end

max_length = 10
max_n = 1
(2..1000000).each do |n|
  chain_n = chain(n)
  if chain_n>max_length
    max_length = chain_n
    max_n = n
  end
end

puts max_n
