def test_prime(a)
  if a==1 || a%2==0
    return false
  end
  (2..Math.sqrt(a)).each do |d|
    if a%d==0
      return false
    end
  end
  return true
end

i = 3
count = 1
while true do
  if test_prime(i)
    count += 1
    if count==10001
      puts i
      break
    end
  end
  i += 2
end
