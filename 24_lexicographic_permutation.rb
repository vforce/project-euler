$n = 10 
$m = Array.new($n, false)
$r = Array.new($n)
$count = 0
def permutation(i)
  if i==$n
    $count += 1
    if $count==1000000
      puts $r.join
      exit
    end
    return
  else
    (0..$n-1).each do |j|
      if !$m[j]
        $m[j] = true
        $r[i] = j
        permutation(i+1)
        $m[j] = false
      end
    end
  end
end
permutation(0)
