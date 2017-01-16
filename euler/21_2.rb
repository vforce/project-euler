def sum_of_divisor(n)
  m = n
  sum = 1
  p = 2
  while p*p<=n and n>1
    if n%p==0
      j = p*p
      n = n/p
      count = 1
      while n%p==0
        j = j*p
        n = n/p
        count += 1
      end
      #puts "#{n} #{j} #{p} #{count}"
      sum = sum*(j-1)
      sum = sum/(p-1)
    end
    if p==2 
      p = 3
    else
      p = p+2
    end
  end
  if n>1 
    sum = sum*(n+1)
  end
  sum - m
end

n = 1000000
sum = 0
(2..n).each do |k|
  x = sum_of_divisor(k)
  if x > k
    if sum_of_divisor(x) == k
      sum += (k + x)
    end
  end
end
puts sum/2

