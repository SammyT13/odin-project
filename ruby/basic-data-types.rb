# Basic Data Types

## Numbers

    # Addition
p 1 + 1

    # Subtraction
p 2 - 1

    # Multiplication
p 2 * 2

    # Division
p 10 / 5

    # Exponent
p 2 ** 2
p 3 ** 4

    # Modulus
p 8 % 2 #=> no remainder
p 10 % 4 #=> with a remainder

    # Integer & Floats
p 17 / 5 #=> 3
p 17 / 5.0 #=> 3.4

    # Convert Integer => Float
p 13.to_f #=> 13.0

    # Convert Float => Integer
p 13.9.to_i #=> 13

## Useful number methods

    # even?
p 6.even? #=> true
p 7.even? #=> false

    # odd?
p 6.odd? #=> false
p 7.odd? #=> true

## Strings

    # Concatenation

        # With the plus operator:
p "Welcome " + "to " + "Odin!"

        # With the shovel operator:
p "Welcome " << "to " << "Odin!"

        # With the concat method:
p "Welcome ".concat("to ").concat("Odin!")

    # Substrings
p "hello"[0] #=> "h"
p "hello"[0..1] #=> "he"
p "hello"[0, 4] #=> "hell"
p "hello"[-1] #=> "o"

    # Escape Characters
        # *** only works in double quotations ***

        # Examples:

        # \\  #=> Need a backslash in your string?
        # \b  #=> Backspace
        # \r  #=> Carriage return, for those of you that love typewriters
        # \n  #=> Newline. You'll likely use this one the most.
        # \s  #=> Space
        # \t  #=> Tab
        # \"  #=> Double quotation mark
        # \'  #=> Single quotation mark

puts "Hello \n\nHello"

    # Interpolation
        # *** only works in double quotations ***

name = "Odin"

puts "Hello, #{name}!"

    # Common String Methods

        #capitalize
p "hello".capitalize #=> "Hello"

        #include
p "hello".include?("lo") #=> true
p "hello".include?("z") #=> false

        #upcase
p "hello".upcase #=> "HELLO"

        #split
p "hello world".split #=> ["hello", "world"]
p "hello".split("") #=> ["h", "e", "l", "l", "o"]

