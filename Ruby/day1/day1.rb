# Print the string “Hello, world.”
puts "Hello, world"

# For the string “Hello, Ruby.” find the index of the word “Ruby.”
a = "Hello, Ruby."
/Ruby/ =~ a

# Print your name ten times.
i = 0
while i < 10
    puts "Domantas"
    i += 1
end

# Print the string “This is sentence number 1,” where the number 1
# changes from 1 to 10.
(1..10).each {|num| puts "This is sentence number #{num}"}

# Guess the random number
number = rand(10)
picked = 11
puts "Try to guess the number!"
while picked != number
    picked = (gets)[0].to_i
    if picked < number
        puts "To low!"
    elsif picked > number
        puts "To high"
    end
end
puts "Correct!"