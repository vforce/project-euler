def gen(i, seen, a)
  if i==9
    (2..4).each do |l|
      a = a.to_s
      base = a.slice(0, l).to_i
      j = 2
      t = l 
      while t<a.size
        multiple = base * j
        break if multiple!=a.slice(t, multiple.to_s.size).to_i
        t += multiple.to_s.size
        j += 1
      end
      if t>=a.size
        puts a
        exit
      end
    end
  else
    8.downto(1).each do |k|
      if !seen[k]
        seen[k] = true
        gen(i+1, seen, a*10+k)
        seen[k] = false
      end
    end
  end
end

seen = {}
(1..8).each do |k|
  seen[k] = false
end
gen(1, seen, 9)
