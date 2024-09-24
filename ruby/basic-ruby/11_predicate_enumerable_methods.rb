# Predicate Enumerable Methods

  # Predicate enumerable methods are a subset of enumerable methods
    # the predicate method is indeicated by a question mark (?) at the end of the method name and returns either 'true' or 'false'

## The include? method
  # we use this if we want to know whether a paticular element exists in an array
    # this method will return true if the element you pass as an argument to #include? exists in the array or has, otherwise, it will return false

# Example_1: using the #each method to check if an element exists in an array

numbers = [5, 6, 7, 8]
element = 6
result = false

numbers.each do |number|
  if number == element
    result = true
    break
  end
end

puts result #=> true

element = 3
result = false

numbers.each do |number|
  if number == element
    result = true
    break
  end
end

puts result #=> false

  # the break statement in the if condition so that loops stops executing once the number is found

# Example_2: using #include?

numbers = [5, 6, 7, 8]

puts numbers.include?(6) #=> true

puts numbers.include(3) #=> false

# Example_ 3: #include?

friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]

invited_list = friends.select { |friend| friend != "Brian" }

invited_list.include?("Brian") #=> false

## The any? method
  # It returns 'true' if any elements in y our array or hash match the condition within the block, otherwise, it will return false

# Example_1: #each method to see if a number greater than 500 or less than 20 in array of numbers

numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number > 500
    result = true
    break
  end
end

result #=> true

numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number < 20
    result = true
    break
  end
end

result #=> false

# Example_2: using #any? to do the same as above

numbers.any? { |number| number > 500 } #=> true

numbers.any? { |number| number < 20 } #=> false

## The all? method
  # only returns true if all the elements in oyour array or hash match the condition you set within the block, otherwise, it will return false

# Example_1: #each to check whether all the words in our list are more than 3 charcters or 6 characters long

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = Array.new
result = false

fruits.each do |fruit|
  if fruit.length > 3
    matches.push(fruit)
  end
end

result = fruits.length == matches.length
puts result #=> true
puts matches

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = Array.new
result = false

fruits.each do |fruit|
  if fruit.length > 6
    matches.push(fruit)
  end
end

result = fruits.length == matches.length
puts result #=> false
puts matches

# Example_2: using #all? to do the same as above

fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.all? { |fruit| fruit.length > 3 } #=> true

fruits.all? { |fruit| fruit.length > 6 } #=> false

## The none? method

  # returns true only if the condition in the block matches none of the  elements in your array or hash, otherwise, it returns false

# Example_1: #each method (you'll notice that this approach is very similar to what we did for #all?)

fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.none? { |fruit| fruit.length > 10 }
#=> true

fruits.none? { |fruit| fruit.length > 6 }
#=> false

