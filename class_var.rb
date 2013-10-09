
# Source: https://github.com/bbatsov/ruby-style-guide
# Avoid the usage of class ( @@ ) variables due to their "nasty" behavior in inheritance.

class Parent
  @@class_var = 'parent'

  def self.print_class_var
    puts @@class_var
  end

  private
  PARENT_CONSTANT = 'parent constant'
end

class Child < Parent
  @@class_var = 'child'
  CHILD_CONST = 'child constant'
end

Parent.print_class_var # => will print "child"
Child.print_class_var

puts "#{Child::CHILD_CONST}"
puts "#{Child::PARENT_CONSTANT}"
