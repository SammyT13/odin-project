# Nested Collections

## Nested Arrays

  # arrays can contain any type of data, including other arrays
    # this is called a nested array or a multidimentsional array

# Example: Nested Arrays (mulitdimensional)

test_scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
]

teacher_mailboxes = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]

  # Accessing Elements

    # remember every element in an array has an index
    # accessing a specific element within a nested array is done by calling: array[x][y]
      # where x is the index of the nested element and y is the index inside of the nested element

# Example: Accessing Arrays

puts teacher_mailboxes[0][0] #=> "Adams"
puts teacher_mailboxes[1][0] #=> "Jones"
puts teacher_mailboxes[2][0] #=> "Perez"

# Example: Accessing elements from the end of an array using negative indices

puts teacher_mailboxes[0][-1] #=> "Davis"
puts teacher_mailboxes[-1][0] #=> "Perez"
puts teacher_mailboxes[-1][-2] #=> "Smith"

  # if you try to access an index of a nonexistent nested element, it will raise an 'NoMethodError' because the nil class doe not have a [] method
  # if you try to access a nonexistent index inside an existing nested element it will return 'nil'

  # if you want a nil value returned when trying to access an index of a nonexistent nested element, you can use the #dig method

# Example: returning nil with #dig method

teacher_mailboxes.dig(3, 0) #=> nil
teacher_mailboxes.dig(0, 4) #=> nil

## Creating a New Nested Array

  # to create an immutable array of mutable objects (string, array, hash, etc), you will need to pass the default value ofr 'Array.new' via a block, using curly braces, instead of the second optional argument
    # the code in the block gets evaluated for every slot in the array, creating objects to initialize the array with, rather than references to the same object

# Example: Using the second optional argument for the default value

mutable = Array.new(3, Array.new(2))
p mutable #=> [[nil, nil], [nil, nil], [nil, nil]]

p mutable[0][0] = 1000 #=> 1000

p mutable #=> [[1000, nil], [1000, nil], [1000, nil]]

  # changing the value of the value of the first element in the first nested array, causes the first element to change in all three nested arrays
    # this same behavior will happen with strings, hasshes, or any other mutable objects

# Example: Omits the second optional argument and instead passes in the mutable value in a block

immutable = Array.new(3) { Array.new(2) }

p immutable #=> [[nil, nil], [nil, nil], [nil, nil]]

p immutable[0][0] = 1000 #=> 1000

p immutable #=> [[1000, nil], [nil, nil], [nil, nil]]


  # notice the change only occurred in the first nested array and nothing happened to the remaining nested arrays

## Adding and Removing elements

  # Adding an Element
    # using the #push method or the shovel operator <<

test_scores << [100, 99, 98, 97]
p test_scores #=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]

p test_scores[0].push(100) #=> [97, 76, 79, 93, 100]

p test_scores #=> [[97, 76, 79, 93, 100], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]

  # Removing an Element
    # similar syntax

test_scores.pop #=> [100, 99, 98, 97]

test_scores[0].pop #=> 100

test_scores #=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

## Iterating Over a Nested Array

  # Using the #each_with_index
    # think of nested arrays as having rows and columns
    # each row is the nested element
    # each column is the index of the nested element

# Example_1: iterate over a nested array using #each_with_index

teacher_mailboxes.each_with_index do |row, row_index|
  puts "Row:#{row_index} = #{row}"
end

#=> Row:0 = ["Adams", "Baker", "Clark", "Davis"]
#=> Row:1 = ["Jones", "Lewis", "Lopez", "Moore"]
#=> Row:2 = ["Perez", "Scott", "Smith", "Young"]

# Example_2: iterate over the individual elements inside of each row, you will need to nest another enumerable method inside

teacher_mailboxes.each_with_index do |row, row_index|
  row.each_with_index do |teacher, column_index|
    puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
  end
end

#=> Row:0 Column:0 = Adams
#=> Row:0 Column:1 = Baker
#=> Row:0 Column:2 = Clark
#=> Row:0 Column:3 = Davis
#=> Row:1 Column:0 = Jones
#=> Row:1 Column:1 = Lewis
#=> Row:1 Column:2 = Lopez
#=> Row:1 Column:3 = Moore
#=> Row:2 Column:0 = Perez
#=> Row:2 Column:1 = Scott
#=> Row:2 Column:2 = Smith
#=> Row:2 Column:3 = Young

  # These examples are a bit contrived, it is important to note that if we only need each teacher's name it would be beneficial to use #flatten method before iterating

# Example_3: since we only want the teachers name we first use the flatten method then we iterate

teacher_mailboxes.flatten.each { |teacher| puts "#{teacher} is amazing!" }

#=> Adams is amazing!
#=> Baker is amazing!
#=> Clark is amazing!
#=> Davis is amazing!
#=> Jones is amazing!
#=> Lewis is amazing!
#=> Lopez is amazing!
#=> Moore is amazing!
#=> Perez is amazing!
#=> Scott is amazing!
#=> Smith is amazing!
#=> Young is amazing!

# Example_4: a more complicated example of nesting two predicate enumerables together (let's determine if any student socred higher than 80 on everything)

test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

test_scores.any? do |scores|
  scores.all? { |score| score > 80 }
end

#=> false

test_scores.all? do |scores|
  scores.any? { |score| score > 80 }
end

#=> true

## Nested Hashes

  # just like arrays hashes can be nested, or multidimensional
  # nested hashes are very common to store complex associated data

# Example_1: nested hash

vehicles = {
  alice: {year: 2019, make: "Toyota", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}

## Accessing Data

  # accessing data from a nested hash is similar to a nested array
    # it is done by calling: hash[:x][:y]
      # :x is the key of the hash
      # :y is the key of the nested hash

# Example_1: accessing data from a nested hash

p vehicles[:alice][:year] #=> 2019

p vehicles[:blake][:make] #=> Volkswagen

p vehicles[:caleb][:model] #=> Accord

  # similar to nested arrays, if you try to access a key in a nonexistent nested hash, it will raise an 'NoMethodError'
    # therefore yo umay want to use the #dig method

# Example_ 2: using #dig method

#vehicles[:zoe][:year]
#=> NoMethodError
vehicles.dig(:zoe, :year)
#=> nil
#vehicles[:alice][:color]
#=> nil
vehicles.dig(:alice, :color)
#=> nil

## Adding and Removing Data

  # you can add more nested hashes, just like a regular hash

# Example_1: adding data to a nested hash

vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"} #=> {:year=>2021, :make=>"Ford", :model=>"Escape"}

p vehicles #=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

# Example_2: adding an element to nested hash

vehicles[:dave][:color] = "red"

p vehicles #=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}

# Example_3: deleting data

vehicles.delete(:blake)

p vehicles #=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}


  # to delete one of the key/value pairs inside of a nested hash
    # you first specify the key of the hash
    # then you indicate the key of the nested hast to delete

# Example_4: deleting one of the key/value pairs inside a nested hash

vehicles[:dave].delete(:color)

p vehicles#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

## Methods

  # there are many helpful method to use with nested hashes
  # once you know what data you need from a nested hash

# Example_1: #select method - we want to know who owns vehicles that are from 2020 or newer

p vehicles.select { |name, data| data[:year] >= 2020 } #=> {:caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

  # using the #select method gives us the info that we need, however what if we only want the names of the owners and not another nested hash?

# Example_2: #collect method

p vehicles.collect { |name, data| name if data[:year] >= 2020 } #=> [nil, :caleb, :dave]

  # using the #collect method gets us a lot closer to only having the names of the new vehicle owners
    # if you look at documentation you'll notice #collect and #map have the same functionalit
    # Both of these methods return value of each iteration, so when the if statement is false it will return a nil value
    # 'nil' values can cause problems down the road
  # to get rid of nil values for both arrays and hashes we could use the #compact method

# Example_3: adding the #compact method to remove nil value (#collect & #map are similar)

p vehicles.map { |name, data| name if data[:year] >= 2020 }.compact #=> [:caleb, :dave]

  # as we can see chaining methods can be very useful
    # however, reading more documentation a new enumerable method called #filter_map can be useful

# Example_4: #filter_map method (we don't have to chain methods and removes nil value)

p vehicles.filter_map { |name, data| name if data[:year] >= 2020 } #=> [:caleb, :dave]


## More Examples:

data = [
  {"id"=>"1", "properties"=>{"name"=>"Google", "stock_symbol"=>"GOOG", "primary_role"=>"company"}},
  {"id"=>"2", "properties"=>{"name"=>"Facebook", "stock_symbol"=>"FB", "primary_role"=>"company"}}
]

# Example_1: #each method (iterating an array)

data.each do |result|
  puts result["id"]
end

# Example_2: #each method (digging into a hash and printing the result) using two methods

data.each do |result|
  # method 1
  puts result["properties"]["name"]

  # method 2
  puts result.dig("properties")
end

  # method 1 uses the hash[key] syntax, and because the first hash value is another hash, it can be chained to get the result you're after
    # the drawback of this approach is that if you have missing 'properties' key on one your results, you'll get an error
  
  # method 2 uses dig, which accepts the nested keys as arguments (in order)
    # it'll dig down into the nested hashes and pull out the value, but if any step is missing, it will return 'nil' which can be a bit safer if you're handling data from an external source

  # completed

    def find_favorite(array_of_hash_objects)
      # take an array_of_hash_objects and return the hash which has the key/value
      # pair :is_my_favorite? => true. If no hash returns the value true to the key
      # :is_my_favorite? it should return nil
    
      # TIP: there will only be a maximum of one hash in the array that will
      # return true to the :is_my_favorite? key
     p array_of_hash_objects.find { |data| data[:is_my_favorite?] == true }
    end


find_favorite( [
  { name: 'Ruby', is_my_favorite?: true },
  { name: 'JavaScript', is_my_favorite?: false },
  { name: 'HTML', is_my_favorite?: false }
])

find_favorite( [
  { name: 'Ruby', is_my_favorite?: false },
  { name: 'JavaScript', is_my_favorite?: false },
  { name: 'HTML', is_my_favorite?: false }
])

## Iterating a Hash

contacts = {
  "Jon Snow" => {
    name: "Jon",
    email: "jon_snow@thewall.we",
    favorite_ice_cream_flavors: ["chocolate", "vanilla", "mint chip"],
    knows: nil
  },
  "Freddy Mercury" => {
    name: "Freddy",
    email: "freddy@mercury.com",
    favorite_ice_cream_flavors: ["strawberry", "cookie dough", "mint chip"]
  }
}

# Example_1: first level of iteration

contacts.each do |person, data|
  puts "#{person}: #{data}"
end

#=> output:
# Jon Snow:
# { :name=>"Jon",
# :email=>"jon_snow@thewall.we",
# :favorite_ice_cream_flavors=>["chocolate", "vanilla", "mint chip"],
# :knows=>nil
# }

# Freddy Mercury:
# { :name=>"Freddy",
# :email=>"freddy@mercury.com",
# :favorite_ice_cream_flavors=>["strawberry", "cookie dough", "mint chip"]
# }