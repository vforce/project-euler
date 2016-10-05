A = [200, 100, 50, 20, 10, 5, 2, 1]
$a = 200
$count = 0
def try(i, amount)
  if i==A.size-1
    $count += 1
    return
  end

  (0..amount/A[i]).each do |x|
    try(i+1, amount - x*A[i])
  end
end

try(0, $a)
puts $count
