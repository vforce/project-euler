count = 0
(1..10**7).each do |n|
  binary = "%b" % n
  if n.to_s == n.to_s.reverse and binary == binary.reverse
    count += n
  end
end
puts count
