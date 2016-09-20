$digits = {
  1 => 'one',
  2 => 'two', 
  3 => 'three', 
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
  20 => 'twenty',
  30 => 'thirty',
  40 => 'forty',
  50 => 'fifty',
  60 => 'sixty',
  70 => 'seventy',
  80 => 'eighty',
  90 => 'ninety',
}

def get_word(n)
  if $digits.has_key?(n)
    $digits[n]
  elsif n<100
    $digits[n] = $digits[n/10*10] + ' ' + $digits[n%10]
    $digits[n]
  elsif n<1000
    last = $digits[n%100].to_s
    result = $digits[n/100] + ' hundred'
    if last!=''
      result += ' and ' + last
    end
    result
  else
    'one thousand'
  end
end

sum_size = 0
(1..1000).each do |n|
  sum_size += get_word(n).gsub(' ', '').size
end
puts sum_size
