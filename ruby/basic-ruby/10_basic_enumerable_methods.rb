# Basic Enumberable Methods

## Introduction

  # As a developer you will have to loop and iterate through arrays, hashes, and objects over and over again
    # However, remember the DRY (Don't Repeat Yourself) approact to programming
  # Well, Ruby keeps iterating DRY through something called enumerables

  # Enumerables: are a set of convenient built-in methods in Ruby that are included as part of both arrays and hashes
    # There are some iteration patterns that you'll find yourself doing again and again, such as transforming, searching for, and selecting subsets of elements in your collections
    # Enumeralbes makes implementing these iteration patterns much easier

## Life Before Enumerables

  # Example: make an invite list for your birthday using your 'friends' array, but you want to exclude 'Brian' from the invite
    # In this instance we might use a loop to iterate

friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]
invite_list = Array.new

for friend in friends do
  if friend != "Brian"
    invite_list.push(friend)
  end
end


puts invite_list

  # This loop isn't hard, but imagine having to do that for every party you host from now until the end of time

  # This is where enumerables come in handy
    # For instance we can use the #select enumeralbe method

friends_list = ["Sharon", "Leo", "Leila", "Brian", "Arun"]

puts friends_list.select { |friend| friend != "Brian"  }

  # Or another enumerable method

puts friends_list.reject { |friend| friend == "Brian"}

## The each method

  # The #each method is the granddaddy of the enumerable methods

# Example_1: one block line

friends_list.each { |friend| puts "Hello, #{friend}!" }

  # Breakdown of Syntax:

    # 'friends_list' is the array that contains strings of your friends' names
    # .each is the enumerable method you are calling on you friends_list array
    # { |friend| puts "Hello, #{friend}!"} is a block, and the code inside this block is run for each element in your array (this block will run 5 times , since we have 5 elements in the array)
    # within the block, you'll notice |friend|, which is known as a block variable
      # this is the element from your array that the blcok is currently iterating over
  
  # If the method requires more logic than can fit on one line it may start to become less readable and looks unwieldy
    # For multi-line blocks, the commonly accepted best practice is to change up the syntax to use 'do...end' instead of {...}

# Example_2: multi-line blocks

my_array = [1, 2, 3, 4, 5]

my_array.each do |num|
  num *= 2
  puts "The new number is #{num}"
end

  # The #each method also works with hashes with a bit of added functionality
    # By default each iteration will yield both the key and value indvidually or together (as an array) to the blcok depending on how you define your block variable

# Example_3: hashes with key and value as block variables

my_hash = {one: 1, two: 2}

my_hash.each { |key, value| puts "#{key} is #{value}" }

# Example_4: hashes with one block variable (pair)

my_hash.each { |pair| puts "the key and value of the hash are  #{pair}" }

  # Remember the #each method returns the original array or hash regardless of what happens inside the code block
    # Remember this when debugging

## The each_with_index method

  # This method is nearly the same as #each, but provides some additional functionality by yielding two block variables instead of one as it iterates through an array
    # The first varialbe's value is the element itself, while the second varialbe's value is the index of the element within the array
    # This allows you to do more complex programming

# Example_1:

fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? } #=> apple, strawberry

puts fruits #=> ["apple", "banana", "strawberry", "pineapple"]

## The map method

  # The map method iterates like the #each method, however, unlike the #each method will still return the original array, the map method allows you to return the array based on the code block

# Example_1: using #each method to return a new array with changes

party_list = ["Sharon", "Leo", "Leila", "Brian", "Arun"]

shouting_at_party = Array.new

party_list.each { |friend| shouting_at_party.push(friend.upcase) }

puts shouting_at_party

  # This works using the #each method, but as you can see there were some extra steps (effort) taken to execute

# Example_2: using #map method

party_list_b = ["Sharon", "Leo", "Leila", "Brian", "Arun"]

party_list_b.map { |friend| friend.upcase }

  # The #map method can help make changes to an array

# Example_3: changing certain values of an  array with #map and #gsub

my_order = ["medium Big Mac", "medium fries", "medium milkshake"]

puts my_order.map { |item| item.gsub("medium", "extra large") }

# Example_4: changing the value of each element in the array

monthly_salary = [1200, 1500, 1100, 1800]

puts monthly_salary.map { |salary| salary - 700 }

  # basically when ever you want to return a new array use the #map method
    # side-note this still doesn't change the original array

## The select method

  # THe #select method (also called #filter) passes every item in an array to block and returns a new array with only the items for which the condition you set in the block evaluated to 'true'

  # Let's first look how we accomplish this using the #each method

# Example_1: filtering using the #each

friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]

invited_list = Array.new

friends.each do |friend|
  if friend != "Brian"
    invited_list.push(friend)
  end
end

puts invited_list

# Example_2: #select method

puts friends.select { |friend| friend != "Brian" }

  # You can also use #select method on hashes

# Example_3: #select and hashes

responses = {Sharon: "yes", Leo: "no", Leila: "no", Arun: "yes"}

puts responses.select { |person, response| response == "yes"}

## The reduce method

 # The #reduce method (also called #inject) is possibly the most difficult-to-grasp enumerable for new coders
  # The general idea is that it takes an array or hash and reduces it down to a single objec
  # You should use #reduce when you want to get an output of a single value

  # A classic example when #reduce is useful is obtaining the sum of an array of numbers

# Example_1: sum of an array using #each

my_numbers = [5, 6, 7, 8]
sum = 0

my_numbers.each { |number| sum += number }

puts sum

  # Now let's try the #reduce method

# Example_2: sum of an array using #reduce

puts my_numbers.reduce { |sum, number| sum + number }

  # Breakdown:
    # The first block variable in the #reduce enumerable (sum) is known as the accumulator
      # The results of each iteration is stored in the accumulator and then passed to the next iteration
      # The accumulator is also the value that the #reduce method returns at the end of its work
      # By default the initial value of the accumulator is the first element in the collection
    # Closer look
      # 1. Iteration 0: sum = 5 + 6 = 11
      # 2. Iteration 1: sum = 11 + 7 = 18
      # 3. Iteration 3: sum = 18 + 8 = 26
  
  # We can also set a different initial value for the accumulator by directly passing in a value to the #reduce method

# EXample_3: setting initial value of accumulator

puts my_numbers.reduce(1000) { |sum, number| sum + number }

# Example_4: #reduce and hashes
  # We're trying to tally the votes of which restuarant to eat at for the party
  # The array below contains the collection of votes

votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end


#=> {"Bob's Dirty Burger Shack"=> 2, "St. Mark's Bistro"=> 1}


## Bang methods

 # Earlier, we mentioned that enumerables like #map and #select return new arrays but don't modify the arrays that they were called on
 # This is by design since we won't often want to modify the original array or hash or accidentally lose information.

 # If we want to change the array instead, you could use the bang method (!)

# Example_1: bang method

frinds = ["Sharon", "Leo", "Leila", "Brian", "Arun"]

friends.map! { |friend| friend.upcase }

puts friends

  # Remember all bang methods are destructive and modify the object they are called on

## Return values of enumerables

  # Since it's best practices not to use bang methods to change the initial value of data, what can we do?
    # One option is to put the result of an enumerable method into a local variable:

# Example_1: setting an enumerable method into a local variable

friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]

invited_friends = friends.select { |friend| friend != "Brian" }

puts invited_friends

    # An even better option would be to wrap your enumerable method in a method definition

# Example_2: wrap an enumerable method in a method definition

def invited_friends(friends)
  friends.select { |friend| friend != "Brian" }
end

puts friends

puts invited_friends(friends)

