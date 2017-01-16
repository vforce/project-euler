$seen = {}
$seen[0] = true
(1..9).each do |n|
  $seen[n] = false
end
$result_seen = {}
$result = 0

def generate(i, memo)
  if i==5
    remain = 0
    $seen.each do |k, v|
      if !v
        remain = remain * 10 + k
      end
    end
    result = (memo.slice(0, 3).to_i * memo.slice(3, 2).to_i).to_s
    if result.chars.size==4 && result.chars.sort.uniq.size == result.size && result.chars.all? {|c| !$seen[c.to_i]}
      puts "#{memo}, #{remain} => #{result}"
      if !$result_seen[result]
        $result_seen[result] = true
        puts "---------> #{result}"
        $result += result.to_i 
      end
    end
    result = (memo.slice(0, 1).to_i * memo.slice(1, 4).to_i).to_s
    if result.chars.size==4 && result.chars.sort.uniq.size == result.size && result.chars.all? {|c| !$seen[c.to_i]}
      puts "#{memo}, #{remain} => #{result}"
      if !$result_seen[result]
        $result_seen[result] = true
        puts "---------> #{result}"
        $result += result.to_i 
      end
    end
    return
  end

  (1..9).each do |j|
    if !$seen[j]
      $seen[j] = true
      generate(i+1, memo + j.to_s)
      $seen[j] = false
    end
  end
end

generate(0, '')
puts $result
