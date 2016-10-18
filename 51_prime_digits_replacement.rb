n = 10**6
bound = n/2-1
limit = Math.sqrt(n).floor/2
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


$is_primes = Hash.new(false)
$is_primes[2] = true
sieve.each_with_index do |v, i|
  if v && i>0
    $is_primes[(2*i+1).to_s] = true
  end
end

def gen(i, seen, res, result)
  if i==0
    result << res 
  else
    (0..1).each do |d|
      if seen[d]>0
        seen[d]-=1
        gen(i-1, seen, res+d.to_s, result)
        seen[d]+=1
      end
    end
  end
end

def fill(i, mask, res)
  if i==0
    range = (res[0]=='*') ? (1..9) : (0..9)
    count = 0
    range.each do |d|
      num = res.gsub('*', d.to_s)
      if $is_primes[num]
        count += 1
      end
    end
    if count == 8
      p res  
    end
  else
    range = (i==mask.size) ? (1..9) : (0..9)
    if mask[mask.size-i]=='0'
      range.each do |d|
        next if i==1 && d%2==0
        fill(i-1, mask, res+d.to_s)
      end
    else
        fill(i-1, mask, res+'*')
    end
  end
end

n = 6
(1..n).each do |i|
  seen = {1=>i, 0=>n-i}
  all_masks = []
  gen(n, seen, '', all_masks)
  all_masks.each do |m|
    fill(n, m, '')
  end
end
