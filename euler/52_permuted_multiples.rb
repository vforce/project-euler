a = 1
def same_digits(a, b)
  return a.to_s.chars.sort==b.to_s.chars.sort
end

while true
  if same_digits(a, 2*a) &&
    same_digits(a, 3*a) &&
    same_digits(a, 4*a) &&
    same_digits(a, 5*a) &&
    same_digits(a, 6*a)
    puts a
    exit
  end
  a += 1


end
