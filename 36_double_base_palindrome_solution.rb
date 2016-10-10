limit = 1000000000
def isPalindrome(n, base)
  res = 0
  m = n
  while m > 0
    res = res * base + m%base
    m /= base
  end
  n == res
end
def makePalindrome(n, base, oddLength)
  res = n
  n = n/base if oddLength 
  while n>0
    res = base * res + n%base
    n = n/base
  end
  res 
end
sum = 0
i = 1
p = makePalindrome(i, 2, true)
while p<limit
  if isPalindrome(p, 10)
    sum += p
  end
  i += 1
  p = makePalindrome(i, 2, true)
end

i = 1
p = makePalindrome(i, 2, false)
while p<limit
  if isPalindrome(p, 10)
    sum += p
  end
  i += 1
  p = makePalindrome(i, 2, false)
end
puts sum
