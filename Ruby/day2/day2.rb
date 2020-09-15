# Print the contents of an array of sixteen numbers
(1..16).each{|num| if num % 4 == 0 then print "#{num}\n" else print "#{num} " end }

# Now, do the same with each_slice in Enumerable
(1..16).each_slice(4) {|num| p num}
