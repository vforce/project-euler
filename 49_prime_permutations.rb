n = 9999
limit = Math.sqrt(n).floor
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

$is_primes = Hash.new(false)
$is_primes[2] = true
sieve.each_with_index do |v,i|
  if v && i>0
    $is_primes[2*i+1] = true
  end
end

def permute(i, seen, memo, res, digits)
  if i==4
    res << memo
    return
  end
  digits.each do |d|
    if !seen[d]
      seen[d] = true
      permute(i+1, seen, memo + d, res, digits)
      seen[d] = false
    end
  end
end

def gen(i, seen, a)
  if i==4
    nums = []
    seen = {}
    permute(0, Hash.new(false), '', nums, a.to_s.chars)
    nums = nums.map {|n| n.to_i}
    nums.sort
    l = nums.size
    i = 0
    while i<l-2
      j = i + 1
      while j<l-1
        if $is_primes[nums[i]] && $is_primes[nums[j]]
          x  = 2*nums[j] - nums[i]
          if nums.include?(x) && $is_primes[x]
            puts nums[i].to_s+nums[j].to_s+x.to_s
            break
          end
        end
        j += 1
      end
      i += 1
    end
    return
  end
  range = (i==0)?(1..9):(0..9)
  range.each do |d|
    next if d<=a%10
    seen[d] = true
    gen(i+1, seen, a*10+d)
    seen[d] = false
  end
end

gen(0, Hash.new(false), 0)
