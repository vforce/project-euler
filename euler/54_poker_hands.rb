$values = %w[2 3 4 5 6 7 8 9 T J Q K A]
$suits = %w[S C D H]
$cards = []
$values.each do |v|
  $suits.each do |s|
    $cards << v+s
  end
end

def same_suit(hand, l, h)
  a = hand.slice(l, h-l+1)
  return a.all? {|c| c[1]==a[0][1]}
end

def sort_hand(hand)
  hand.sort {|a, b| $cards.index(b) <=> $cards.index(a)}
end

def group_hand(hand)
  result = Hash.new(0)
  hand.each do |c|
    (value, _) = c.chars
    result[value] += 1 
  end
  result.entries.sort_by {|v, n| [n, $values.index(v)]}.reverse
end

#assume that hand is already sorted
def royal_flush(hand)
  hand.map {|c| c[0]} == %w[T J Q K A] && same_suit(hand, 0, hand.size-1)
end

def split_hand(hand)
  res = Hash.new {|h, k| h[k]=Array.new}
  hand.each do |c|
    res[c[0]] << c[1]
  end
  res
end

def one_pair(hand)
  res = split_hand(hand)
  res.size==4 && res.values.map {|v| v.size}.sort == [1,1,1,2]
end

def two_pairs(hand)
  res = split_hand(hand)
  res.size==3 && res.values.map {|v| v.size}.sort == [1,2,2]
end

def three_of_a_kind(hand)
  res = split_hand(hand)
  res.size > 2 && res.keys.any? {|k| res[k].size==3}
end

def four_of_a_kind(hand)
  res = split_hand(hand)
  res.size == 2 && res.keys.any? {|k| res[k].size==4}
end

def flush(hand)
  same_suit(hand, 0, 4)
end

#assume hand is already sorted
def straight(hand)
  i = 0
  while i<4
    return false if $values.index(hand[i].chars[0]) != $values.index(hand[i+1].chars[0])+1
    i += 1
  end
  true
end

def straight_flush(hand)
  straight(hand) && flush(hand)
end

def full_house(hand)
  res = split_hand hand
  keys = res.keys
  res.size == 2 && (res[keys[0]].size==3 || res[keys[1]].size==3)
end

$ranks = [0, 'royal flush', 'straight flush', 'four of a kind', 'full house', 'flush', 'straight', 'three of a kind', 'two pairs', 'one pair', '0']

def rank(hand)
  return 1 if royal_flush(hand)
  return 2 if straight_flush(hand)
  return 3 if four_of_a_kind(hand)
  return 4 if full_house(hand)
  return 5 if flush(hand)
  return 6 if straight(hand)
  return 7 if three_of_a_kind(hand)
  return 8 if two_pairs(hand)
  return 9 if one_pair(hand)
  10
end

def compare(hand1, hand2)
  hand1 = sort_hand(hand1)
  hand2 = sort_hand(hand2)
  rank1 = rank(hand1)
  rank2 = rank(hand2)
  return 1 if rank1<rank2 
  return -1 if rank1>rank2
  g1 = group_hand(hand1)
  g2 = group_hand(hand2)
  (0..4).each do |i|
    if g1[i][1]>g2[i][1]
      return 1
    elsif g1[i][1]<g2[i][1]
      return -1
    else
      if $values.index(g1[i][0])>$values.index(g2[i][0])
        return 1
      elsif $values.index(g1[i][0])<$values.index(g2[i][0])
        return -1
      end
    end 
  end
  p 'failed' 
  group_hand(hand1) <=> group_hand(hand2)
end


raise "wrong suite #1" unless same_suit(['TD', 'QD', 'JD'], 0, 2)
raise "wrong sort #1" unless sort_hand(['2D', '4D', '4S'])==['4D', '4S', '2D']
raise "wrong sort #2" unless sort_hand(['TD', '4D', 'QS'])==%w[QS TD 4D]
raise "wrong royal flush" unless royal_flush(%w[TS JS QS KS AS])
raise "wrong four of a kind #1" unless four_of_a_kind(%w[2D 3S 3C 3D 3H])
raise "wrong four of a kind #2" unless !four_of_a_kind(%w[2D 3S 2C 3D 3H])
raise "wrong straight flush #1" unless straight_flush(%w[6D 5D 4D 3D 2D])
raise "wrong straight flush #2" unless !straight_flush(%w[6S 5D 4D 3C 2S])
raise "wrong full house #1" unless full_house(%w[2D 3S 3D 3H 2H])
raise "wrong full house #1" unless !full_house(%w[4D 3S 3D 3H 2H])
raise "wrong three of a kind #1" unless three_of_a_kind(%w[2D 3S 4H 4D 4S])
raise "wrong three of a kind #2" unless !three_of_a_kind(%w[3D 3S 4H 4D 4S])
raise "wrong two pairs #1" unless two_pairs(%w[2D 2S 3D 3C 4S])
raise "wrong one pair #1" unless one_pair(%w[2D 2S 3D 4S 5C]) 

count = 0
line_no = 0
File.open('p054_poker.txt', 'r') do |f|
  f.each_line do |line|
    line_no += 1
    #break if line_no > 20
    cards = line.split
    hand1 = sort_hand(cards.slice(0, 5))
    hand2 = sort_hand(cards.slice(5, 5))
    result = compare(hand1, hand2)
    #p group_hand(hand1)
    #p group_hand(hand2)
    p "#{hand1.join(' ')} (#{$ranks[rank(hand1)]}) #{hand2.join(' ')} (#{$ranks[rank(hand2)]}) -> #{result}" #if line_no > 10
    if result>0
      count += 1
    end
  end
end
p count
