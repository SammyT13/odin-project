# Conditional Logic

    # Conditinal statements will evaluate expressions to true or false 
        # this will determine if the machine should execute or not execute the code that follows

# Truthy and Falsy in Ruby

    # The only 'false' values in Ruby are the values 'nil' and 'false'

# Basic Conditional Statement

# if statement_to_be_evaluated == true
#     # do something...
# end

# Example:

if 1 < 2
    puts "Hot diggity, 1 is less than 2!"
end

# Spaceship Operator
    # <=> (spaceship operator) returns the following:

        # -1 if the value on the left is less than the value on the right;
        # 0 if the value on the left is equal to the value on the right; and
        # 1 if the value on the left is greater than the value on the right.
    # the spaceship operator is most commonly used in sorting functions

puts 5 <=> 10    #=> -1
puts 10 <=> 10   #=> 0
puts 10 <=> 5    #=> 1

# Logical Operators
    # && (and)
    # || (or)
    # ! (not)

# Case Statements

grade = 'F'

did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
  when 'A' then "Hell yeah!"
  when 'D' then "Don't tell your mother."
  else "'YOU SHALL NOT PASS!' -Gandalf"
end

puts did_i_pass

    # If you need to do some more complex code manipulation you can remove 'then' keyword and instead place the code to be executed on the next line

grade = 'F'

case grade
when 'A'
    puts "You're a genius"
    future_bank_account_balance = 5_000_000
when 'D'
    puts "Better luck next time"
    can_i_retire_soon = false
else
    puts "'YOU SHALL NOT PASS!' -Gandalf"
    fml = true
end

# Unless Statements
    # works the opposite way as an 'if' statment
        # it only processes the code in the block if the expression evaluates to 'false'

age = 19
unless age < 18
    puts "Get a job."
end

    # Like if statments you can write else clause
        
age = 19
puts "Welcome to a life of debt." unless age < 18

unless age < 18
    puts "Down with that sort of thing."
else
    puts "Careful now!"
end
    
#  Ternary Operator
    # It is a one-line if...else statement

age = 19
response = age < 18 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."

# Example

# conditional.rb

puts "Put in a number"
a = gets.chomp.to_i

if a == 3
  puts "a is 3"
elsif a == 4
  puts "a is 4"
else
  puts "a is neither 3, nor 4"
end
