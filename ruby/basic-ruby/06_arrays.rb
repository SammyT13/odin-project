# Arrays

## Creating Array

    # Using Array Literals []

num_array = [1, 2, 3, 4, 5]
str_array = ["This", "is", "a", "small", "array"]

### - arrays are commonly created with an array literal by use square brackets []

    # Calling the Array.new method
        # whenyou call this method you can also include up to 2 optional arguments

Array.new #=> []
Array.new(3) #=> [nil, nil, nil]
Array.new(3, 7) #=> [7, 7, 7]
Array.new(3, true) #=> [true, true, true]

## Accessing Elements
    # Every element in an array has an index
        # it's a numerical representation of the element's position in the array
        # Ruby arrays (like most prog lang) use zero-based indexing
            # meaning the first element is 0
    # Accessing a speific element within an array:
        # my_array[x]
        # calling an invalid position will result in 'nil'

str_arr = ["This", "is", "a", "small", "array"]

str_arr[0] #=> "This"
str_arr[1] #=> "is"
str_arr[4] #=> "array"
str_arr[-1] #=> "array"
str_arr[-2] #=> "small"

    # Ruby provides the #first and #last array methods
        # both methods can take an integer argument which return a new array that contains the first or last n elements

str_arr.first #=> "This"
str_arr.first(2) #=> ["This", "is"]
str_arr.last(2) #=> ["small", "array"]

## Adding and Removing Elements
    # Adding an element to an existing array is done by using the push method or the shovel operator <<
        # both methods adds the element to the end of the array and return that array with new elements
    # The pop method will remove the element at the end of an array and return the element that was removed

num_arr = [1, 2]

num_arr.push(3, 4) #=> [1, 2, 3, 4,]
num_arr << 5 #=> [1, 2, 3, 4, 5]
num_arr.pop #=> 5
num_arr #=> [1, 2, 3, 4]

    # The methods shift and unshift are used to add and remove elements at the beginning of an array
        # unshift method adds elements to the beginning of an array and returns that array (like push)
        # shift methods removes the first element of an array and returns that element (like pop)

num_arr = [3, 3, 4]

num_arr.unshift(1) #=> [1, 2, 3, 4]
num_arr.shift #=> 1
num_arr #=> [2, 3, 4]

    # pop and shift can take integer arguments

num_arr = [1, 2, 3, 4, 5, 6]

num_arr.pop(3) #=> [4, 5, 6]
num_arr.shift(2) #=> [1, 2]
num_arr #=> [3]

## Adding and Subtracting Arrays

    # Adding two arrays can be done by using + symbol or the concat method

a = [1, 2, 3]
b = [3, 4, 5]

a + b #=> [1, 2, 3, 3, 4, 5]

a.concat(b) #=> [1, 2, 3, 3, 4, 5]

    # To find the difference between two arrays you can subtract them using the - symbol
        # This method returns a copy of the first array, removing any elements that appear in the second array
    
[1, 1, 1, 2, 2, 3, 4] - [1, 4] #=> [2, 2, 3]

## Basic Methods
    # Ruby provides many mehtods to manipulate arrays and their contents (>150)
    # Calling the methods method will yield a long list of available methods

num_arr.methods #=> a long list of methods

    # Some common array methods

[].empty? #=> true
[[]].empty? #=> false
[1, 2].empty? #=> false

[1, 2, 3].length #=> 3

[1, 2, 3].reverse #=> [3, 2, 1]

[1, 2, 3].include?(3) #=> true
[1, 2, 3].include?("3") #=> false

[1, 2, 3].join #=> "123"
[1, 2, 3].join("-") #=> "1-2-3"



