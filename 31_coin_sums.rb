coins = [200, 100, 50, 20, 10, 5, 2, 1]
next_coins = {}
coins.each do |c|
  if c!=1
    next_coins[c] = coins[coins.index(c)+1]
  end
end
coins_reverse = coins.reverse
n = 10000
A = Array.new(n+1) {{}}
(0..n).each do |i|
  coins_reverse.each do |c|
    A[i][c] = 0
    if c==1 || i==0
      A[i][c] = 1
    else
      (0..i/c).each do |j|
        A[i][c] += A[i-j*c][next_coins[c]]
      end
    end
  end
end

puts A[n][200]
