# Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. 
# You will need to do a simple regular expression match and read lines from a file. 
# (This is surprisingly simple in Ruby.) If you want, include line numbers.

def grep(regex, filename)
    file = File.readlines(filename)
    file = file.each_with_index.map{|x,i| "#{i+1} #{x}"}.map(&:chomp).select{|i| i[regex]}
    puts file
end

if ARGV[0] && ARGV[1]
    grep(ARGV[0], ARGV[1])
else
    puts "grep [regex] [filename]"
end