# Hashes

## Arrays vs. Hashes
    # Arrays rely on numerical indices
        # Arrays follow some kind of order, which can be hard when trying to call specific data
    # Hashes rely on keys and values
        # keys is the name which point
        # values represent items/information that the key pointed to
        # doesn't require any kind of order, as long as you know the key's name, you will get the value

## Creating Hashes

    # Example 1: most basic way of creating a hash

my_hash_0 = {
    "a random word" => "ahoy",
    "Dorothy's math test score" => 94,
    "an array" => [1, 2, 3],
    "an empty hash within a hash" => {}
}
    # the above have four keys that point to four different values:
        # key 1: "a random word" value: "ahoy"
        # key 2: "Dorothy's math test score" value: 94
        # key 3: "an array" value: [1, 2, 3]
        # key 4: "an empty hash within a has" value {}

    # Keys and values are associated with a special operator called hash rocket =>

    # Just like an array you can create a new hash by calling the ::new method on the Hash class

my_hash_1 = Hash.new
my_hash_1 #=> {}

    # Hashes don't only take strings as keys and values

my_hash_2 = { 9 => "nine", :six => 6}

## Accessing Values

    # You can access values in hash similar to accessing elements in an array
        # name_of_hash[name_of_key] #=> value associated to key

shoes = {
    "summer" => "sandals",
    "winter" => "boots"
}

shoes["summer"] #=> "sandals"
p shoes["summer"]

    # Trying to access a key that doesn't exist in a hash will return nil

shoes["hiking"] #=> nil
p shoes["hiking"] #=> nil

    # Trying to access a key that doesn't exist can be problematic and causes errrors in you program
    # Luckily Ruby has a fetch method that will raise an error when accessing a key that is not in your hash
    # Solution: fetch method

shoes.fetch("hiking") #=> KeyError: key not found: "hiking"
p shoes.fetch("hiking") #=> KeyError: key not found: "hiking"

    # Alternatively this method can return a defaul value instead of rasing an error if the given key is not found

shoes.fetch("hiking", "hiking boots") #=> "hiking boots"

## Adding and Changing Data

    # You can add a key-value pair to a has by calling the key and setting value, just like you would with any other variable in ruby

shoes["fall"] = "sneakers"

shoes #=> {"summer"=>"sandals", "winter"=>"boots", "fall"=>"sneakers"}

    # Same approach could be used to change the value of an existing key

shoes["summer"] = "flip-flops"

shoes #=> {"summer"=>"flip-flops", "winter"=>"boots", "fall"=>"sneakers"}

## Removing Data

    # Deleting data from a hash is done with the hash's #delete method
        # This provides the functionality of returning the vlaue of the key-value pair that was deleted from the hash

shoes.delete("summer") #=> "flip-flops"
shoes #=> {"winter"=>"boots", "fall"=>"sneakers"}

## Methods

    # Hashes respon to many of the same methods as arrays do since they both employ Ruby's Enumerable module
    # Two useful methods that are specific to hashes are the #keys and #values methods which return keys and values of a hash, respectively
        # Note both methods return arrays

books = {
    "Infinite Jest" => "David Foster Wallace",
    "Into the Wild" => "Jon Krakauer"
}

books.keys #=> ["Infinite Jest", "Into the Wild"]
books.values #=> ["David Foster Wallace", "Jon Krakauer"]

## Merging Two Hashes

    # Occasionally you might come accross a situation where two hashes must be merged, which is done so by the #merge method

hash1 = {"a" => 100, "b" => 200}
hash2 = {"b" => 245, "c" => 300}
hash1.merge(hash2) #=> {"a" => 100, "b" => 245, "c" => 300}

    # Noticed when two hashes have the same key the second hash overwrites the value of the key they both had in common

## Symbols as Hash Keys

    # In this lesson we mostly used strings for hash keys, but in the real world, you'll almost always see symbols (like :this_guy) used as keys
        # This is because symbols are far more performant than strings in Ruby and allow for much cleaner syntax when defining hashes

# 'Rocket' Syntax
american_cars = {
    :chevrolet => "Corvette",
    :ford => "Mustang",
    :dodge => "Ram"
}

# 'Symbols' Syntax
japanese_cars = {
    honda: "Accord",
    toyota: "Corolla",
    nissan: "Altima"
}

    # When using the cleaner 'symbols' syntax to create a hash, you'll still need to use the standard symbol syntax when trying to access the value

american_cars[:ford] #=> "Mustang"
japanese_cars[:honda] #=> "Accord"
