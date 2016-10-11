numbers = {}
(1..100).each do |i|
  numbers[i*(i+1)/2] = true
end
count = 0
File.open('p042_words.txt', 'r') do |f|
  f.each_line do |line|
    line.gsub('"', '').split(',').each do |word|
      sum = word.chars.inject(0) {|memo, c| memo + c.ord-64 }
      if numbers[sum]
        count += 1
      end
    end
  end
end
puts count
