# Methods


## Ruby's Built-In Methods
    # Ruby has a large number of built in methods
    # Methods are called by adding '.method_name' after an instance of the object that contains that method
        # Remember everything in Ruby is an object

"anything".reverse

    # Ruby also has built-in methods that are globally accessible
        # Example: 'print' 'puts'
        # These methods are called with just their name and any argument

puts "anything" #=> anything

     # Most languages require parenthesis () to pass an argument, but Ruby doesn't

## Creating a Method

    ## You can create your own custom methods in Ruby using the following syntax:

def my_name
    "Joe Smith"
end

puts my_name #=> "Joe Smith"

    # Break down:
        # 'def' is a built-in keyword that tells Ruby that this is the start of a method definition
        # 'my_name' is the name of the name the new method (you can name a method anything but there are some constraints and conventions)
        # 'Joe Smit' is the code inside the method body (all the logic and instructions go inside)
        # 'end' is a built-in method that tells Ruby that this is the end of the method definition
        # To call the method, you need to use its name

## Method Names

    # Convention
        # Can use numbers, capital & lowercase letters, and the special characters '_, ?, !, ='
        # You also follow the snake_case convention
        # It's important to start methods with lowercase letters because names that start with uppercase are constants in Ruby

    # Don'ts
        # There are 40 reserved words such as 'end, while, or for'
        # Cannot use any symbols other than '_, ?, !, ='
        # Cannot use '?, !, =' anywhere other than at the end of the name
        # Cannot begina method name with a number
 
    # Examples

        # method_name      # valid
        # _name_of_method  # valid
        # 1_method_name    # invalid
        # method_27        # valid
        # method?_name     # invalid
        # method_name!     # valid
        # begin            # invalid (Ruby reserved word)
        # begin_count      # valid

## Parameters and Arguments

    # Parameters
        # are varialbes that your method will receive when it is called

def greet(name)
    "Hello, #{name} !"
end

puts greet ("John") #=> Hello, John!

    # In this example, name is a parameter that the greet method uses to returna more specific greeting
    # The method was called using the argument "John"
    # Remember: parameters act as a placeholder variables in the template of your method, whereas arguments are the actual variables that get passed to the method when it's called

    # Default Parameters
        # You might not always want to provide arguments for each parameter (maybe it's unknown)

def greet_default(name = "stranger")
    "Hello, #{name} !"
end

puts greet_default("Jane") #=> Hello, Jane!
puts greet_default #=> Hello, stranger!

## What Methods Return

    # In the my_name method it was pretty clear that "Joe Smith" would return
        # In most languages, however, such a method would not return anything because it does not have an 'explicit return' statement
        # We could write the code like this:
def my_name
    return "Joe Smith"
end

    # Ruby doesn't require 'return' since it offers 'implicit return' for methods
        # This means Ruby will return the last expression that was evaluated even without the 'return' keyword

def even_odd(number)
    if number % 2 == 0
        "That is an even number"
    else
        "That is an odd number"
    end
end

puts even_odd(16) #=> That is an even number
puts even_odd(17) #=> That is an odd number

    # The keyword return does have a place in Ruby
        # It can be useful when you want to write a method that checks for input errors before continuing

def even_odd(number)
    unless number.is_a? Numeric
        return "A number was not entered."
    end

    if number % 2 == 0
        "That is an even number."
    else 
        "That is an odd number."
    end
end

puts even_odd(20) #=> That is an even number.
puts even_odd("Ruby") #=> A number was not entered.

## Chaining Methods

    # We can chain methods with built-in methods or methods we created

    # Example:

phrase = ["be", "to", "not", "or", "be", "to"]

puts phrase.reverse.join(" "). capitalize #=> "To be or not to be"

## Predicate Methods

    # Sometimes you'll encounter built-in Ruby methods that have a question mark '?' at the end of their name, such as 'even?, odd?, or between?'
        # These are all predicate methods, which is a naming convention that Ruby uses for methods that return a Boolean (true/false)

puts 5.even? #=> false
puts 6.even? #=> true
puts 17.odd? #=> true

puts 12.between?(10, 15) #=> true

## Bang Methods

    # Observe:

whisper = "HELLO EVERYBODY"

puts whisper.downcase #=> "hello everybody"
puts whisper #=> "HELLO EVERYBODY"

    # As we can see using the 'downcase' method didn't change the original value of the object
        # A general rule is you don't want your methods to overwrite the objects that you call them on
        # This protects you from irrevesibly overwritting your data by accident
        # You are able to overwrite your data by explicitly re-assigning a variable (such as whisper = whisper.downcase)
    # Antoher way to do this type of reassignment is with 'bang' methods using the exclamation mark '!' at the end of the method name

puts whisper.downcase! #=> "hello everybody"
puts whisper #=> "hello everybody"
