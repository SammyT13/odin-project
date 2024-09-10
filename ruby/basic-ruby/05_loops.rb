# Loops in Ruby


# Loop
    # it's an infinite loop that will keep going unless you specifically request for it to stop by using keyword 'break'
        # break is used with a condition to be met
        # this loop is not used often
        # better loops methods below

i = 0

loop do
    puts "i is #{i}"
    i += 1
    break if i == 10
end

# While loop

    # while loop count
i = 0
while i < 10 do
    puts "i is #{i}"
    i +=1
end

    # while loops repeat until condition is met
while gets.chomp != "yes" do
    puts "Are we there yet?"
end

# Until loop
    # opposite of the 'while' loop
        # until loop continues for as long as the condition is false
        # great to use instead of using negation ('!') like we did above
i = 0
until i >= 10 do
    puts "i is #{i}"
    i += 1
end

    # loop without negation
until gets.chomp == "yes" do
    puts "Do you like Pizza?"
end

# Ranges
    # used when we know how many times we want a loop to run
    # ranges are defined with an interval (use two dots)
    # there are inclusive ranges
        # (1..5) --> 1, 2, 3, 4, 5
    # there are exclusive ranges (use three dots)
        # (1...5) --> 1, 2, 3, 4
    # ranges can also be made of letters
        # ('a'..'d')

# For loop
    # used to iterate through a collection of information like an array or range

for i in 0..5
    puts "#{i} zombies incoming!"
end

# Times loop
    # runs a loop a specified number of times

5.times do
    puts "Hello, world!"
end

5.times do |number|
    puts "Alternative fact number #{number}"
end

# Upto and Downto loops

5.upto(10) {|num| print "#{num} "} #=> 5 6 7 8 9 10

10.downto(5) do |num|
    print "#{num} "
end
#=> 10 9 8 7 6 5

x = gets.chomp.to_i

until x < 0
    puts x
    x -=1
end

puts "Done!"

# fibonacci.rb

def fibonacci(number)
    if number < 2
      number
    else
      fibonacci(number - 1) + fibonacci(number - 2)
    end
  end
  
  puts fibonacci(5)







