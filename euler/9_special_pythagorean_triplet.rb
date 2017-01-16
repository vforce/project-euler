333.downto(1) do |a|
  (a..(1000-a)/2).each do |b|
    c = 1000-a-b
    if a*a+b*b==c*c
      puts a*b*c
    end
  end
end
