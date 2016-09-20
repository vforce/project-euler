names = []
File.open('p022_names.txt', 'r') do |file|
  file.each_line do |line|
    names = line.gsub('"', '').split(',').sort
    puts names.map{|name| name.chars.map{|c| c.ord-64}.inject(0, :+)}.each_with_index.map{|x, i| x*(i+1)}.inject(0, :+)
  end
end
