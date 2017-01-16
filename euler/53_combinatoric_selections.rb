count = 0
(23..100).each do |n|
  (1..n-1).each do |r|
    p = 1
    k = r+1
    l = 2
    while k<=n
      p *= k
      while p%l==0 && l<=n-r
        p /= l
        l += 1
      end
      k += 1
    end
    count = count + 1 if p>1000000
  end
end
p count
