# Debugging

## Reading the Stack Trace

    # When a Ruby program crashes after encountering a runtime error or exception, it will produce a wall of text known as a 'stack trace' that is then ouput in your terminal

    # The stack trace prnts each line of code in your program that was executed before it crashed

    # The very first line of the stack trace will generally provide the most useful information about the error your program encountered
        # First, this line of the stack trace will tell you what specific line caused the runtime error
        # This line also provides a brief explanation of the error and the name of the error

## Debugging with puts

    # The debugging process is all about confirming assumptions about y our code until you find something that goes against your assumptions
        # Like a variable or method returning what you expected?
        # Was the output what you expected?

    # The easiest and quickest way to confirm your assumptions while debugging is by using 'puts' statements to output the return value of variables, methods, calculations, iterations, or even entire lines of code to your terminal

# Example: method that takes a string and checks if the string is an 'isogram' (a word that has no repeating letters)

def isogram?(string)
    original_length = string.length
    string_array = string.downcase.split("")
    unique_length = string_array.uniq.length 
    original_length == unique_length
end

puts isogram?("Odin")

    # Debuggin with puts and nil
        # using 'puts' is a great way to debug, but there's a HUGE caveat with using it: calling 'puts' on anything that is 'nil' or an empty string will just print a blank line to your terminal
        # this is one instance where using 'p' will yield more information
            # 'p' is a combination of puts and the #inspect method

## Debugging with Pry-byebug

    # Pry is a Ruby gem that provides you with an interactive REPL while your program is running
        # The recommended Ruby gem for debugging is 'Pry-byebug' and it includes Pry as a dependency
            # Pry-byebug adds step-by-step debuggin and stack navigation
    # To yous Pry-byebug, you'll need to install it in your terminal by running: $ gem install pry-byebug
        # You can then make it available in your program by requiring it at the top of your file with: require 'pry-byebug'

require 'pry-byebug'

def isogram(string)
    original_length = string.length
    string_array = string.downcase.split

   # binding.pry

    unique_length = string_array.uniq.length 
    original_length == unique_length
end

isogram("Oding")

    # When your code executes and gets to 'binding.pry' it will open an IRB-like session in your terminal
    # You can then use that session to check the values of anything within the scope of where you included 'binding.pry'
        # Keep in mind that any code written after the 'binding.pry' statement will not have been evaluated during the Pry session

# Example: 

def yell_greeting(string)
    name = string

    binding.pry

    name = name.upcase
    greeting = "WASSAP, #{name}!"
    puts greeting
end

yell_greeting("bob")

    # During this session, if you check for the value of 'name', you will notice that you get back the value 'bob' instead of 'BOB'
    # If I were to check the value of greeting it will return nill
        # This is because 'name = name.upcase' and 'greeting = "WASSUP, #{name}!"' occurred after the 'binding.pry' call
    # If I enter 'next' it will step over the next line of code and evaluate it
        # If I type name again it will return "BOB"
    # If I type next again it will skip over the next line and evaluate greeting
        # If I type greeting it will evaluate greeting and return "WASSAP, BOB!"
    # As we can see Pry-byebug for debugging achieves the same outcome as 'puts' debugging: it allows you to confirm the assumptions you have about particular parts of your code
        # If you code is complex Pry-byebug will probably allow you to debug quicker thanks to its interactive runtime environment

## How to Start Debugging

    # Programs generally go wrong due to two main reasons:
        # Reason 1: The program encounters an error and won't run. For example, a typo may cause a syntax error to be raised that causes the program to crash.  In this case, Ruby provides a stack trace.
        
        # Reason 2: The program runs but does not work the way you expect. For example, you expect a method to returna 2, but it actually returns 6 when you run it. In this case, there is no stack trace.

    # Obviously, if available, the stack trace is the first place to look when debugging. However, if there's no trace, then 'puts' and 'Pry' are the easiest and quckest tools you can use to get yoursel back up and running.

    
