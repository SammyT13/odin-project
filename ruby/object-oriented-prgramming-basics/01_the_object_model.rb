# Object Oriented Programming: The Object Model

## Why OOP?

  # Encapsulation
    # describes the idea of bundlin or combining the data and the operations that work on that data into a single entity, e.g., an object
    # also hides functionality to make it unavailable to the rest of the code base
    # it's a form of data protection, so data can't be manipulated or changed without obvious intent

  # Polymorphism
    # is the ability for different types of data to respond to a command interface
      # For instance, if we have a method that invokes the 'move' method on a its argument, we can pass the method any type of argument as long as the argument has a compatible 'move' method
        # the object might represent a human, a cat, a jellyfish, or, conceivabley, even a car or train

  # Inheritance
    # where a class inherits -- that is, acquires == the behaviors of another class, referred to as the superclass
    # this gives Ruby programmers the power to define basic classes with large reusability and smaller sublasses for more fine-grained, detailed behaviors

## What are Objects?

  # In the Ruby community you'll often hear the phrase: "In Ruby, everything is an object!"
    # This is not strictly true
    # not everything in Ruby is an object
  # However, anything that can be said to have a value is an object: that includes numbers, strings, arrays, and even classes and mondules
  # However, there are a few things that are not objects: methods, blocks, and variables are three that stand out

  # Objects are created from classes
    # think of classes as molds and objects as the things you produce out of those molds
  
# Example:
p "hello".class #=> String
p "world".class #=> String

  # in the above example, we use the 'class' instance method to determine what the class is for each object

## Classes Define Objects

  # Ruby defines the attribues and behaviors of its objects in classes
    # think of classes as a basic outlines of what an object should be made of and what it should be able to do
  # To define a class, we use syntax similar to defining a method
    # we preplace the 'def' with 'class' and use the CamelCase naming convention to create the name
    # we then use the reserved word 'end' to finish the definition
    # ruby file names should be in snake_case, and reflect the class name
      # Example: file name is good_dog.rb and the class name is GoodDog

# Example

class GoodDog
end

sparky = GoodDog.new
puts sparky

  # in the above example, we created and instance of our 'GoodDog' class and stored it in the variable sparky
    # we now have an object
    # we say 'sparky' is an object or instance of class 'GoodDog'
  # This entire workflow of creating a new object or instance from a class is called instantiation, so we can also say that we've instantiated an object called 'sparky' from the class 'GoodDog'

## Modules
  
  # remember modules are another way to achieve polymorphism in ruby
  # A module is a collection of behaviors that is usable in other classes via mixins
    # a module is "mixed in" to a class using 'include' method invocation

# Example

module Speak
  def speak(sound)
    puts sound
    puts "#{sound}" # added this to see the method look up chain from below
  end
end

class GoodCat
  include Speak
end

class HumanBeing
  include Speak
end

fluffy = GoodCat.new
fluffy.speak("Meow!") #=> Meow!

bob = HumanBeing.new
bob.speak("Hello!") #=> Hello!

  # this can also be added to the 'GoodDog' class

## Method Lookup

  # When calling a method how does Ruby know where to look for that methd?
    # Ruby has a distinct lookup path athat if follows each time a method is called
    # lets use the 'ancestors' method on any calss to find out the method look up chane

puts "---GoodCat Ancestors---"
puts GoodCat.ancestors
puts ''
puts "---HumanBeing Ancestors---"
puts HumanBeing.ancestors

# Output from above
# ---GoodDog ancestors---
# GoodDog
# Speak
# Object
# Kernel
# BasicObject

# ---HumanBeing ancestors---
# HumanBeing
# Speak
# Object
# Kernel
# BasicObject