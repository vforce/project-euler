puts (1..100).inject(1) {|memo, x| memo*x}.to_s.chars.map {|i| i.to_i}.inject(0) {|memo, x| memo+x}
