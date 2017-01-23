a = []
ARGF.each_with_index do |line, idx|
  if idx == 0
    n = line.to_i
  else
    a << line.chomp.split.each {|x| x.to_i}
  end
end
def traverse

end

