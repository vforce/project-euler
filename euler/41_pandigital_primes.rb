def is_prime(n)
  (2..Math.sqrt(n).floor+1).each do |k|
    if n%k==0
      return false
    end
  end
  true
end

def gen(i, seen, a, max_length)
  if i==0
    if is_prime(a)
      puts a
      exit
    end
  else
    max_length.downto(1).each do |k|
      if !seen[k] 
        seen[k] = true
        gen(i-1, seen, a*10+k, max_length)
        seen[k] = false
      end
    end
  end
end


8.downto(2).each do |l|
  gen(l, Hash.new{|hash, key| hash[key]=false}, 0, l)
end
