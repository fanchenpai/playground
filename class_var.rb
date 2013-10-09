
# Source: https://github.com/bbatsov/ruby-style-guide
# Avoid the usage of class ( @@ ) variables due to their "nasty" behavior in inheritance.

class Parent
  @@class_var = 'parent'
  def self.print_class_var
    puts @@class_var
  end
end

class Child < Parent
  @@class_var = 'child'
end

Parent.print_class_var # => will print "child"
Child.print_class_var
