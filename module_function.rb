# Source: https://github.com/fanchenpai/playground.git

# Favor the use of module_function over extend self
# when you want to turn a module's instance methods into class methods.

# bad
module Utilities
  extend self

  def parse_something(string)
    # do stuff here
  end

  def other_utility_method(number, string)
    # do some more stuff
  end
end

# good
module Utilities
  module_function

  def parse_something(string)
    # do stuff here
  end

  def other_utility_method(number, string)
    # do some more stuff
  end
end


#===============
# Source: http://ruby-doc.org/core-2.0.0/Module.html#method-i-module_function

# module_function(symbol, ...) → self click to toggle source

# Creates module functions for the named methods. These functions may be called with
# the module as a receiver, and also become available as instance methods to classes
# that mix in the module. Module functions are copies of the original, and so may be
# changed independently. The instance-method versions are made private. If used with
# no arguments, subsequently defined methods become module functions.

module Mod
  def one
    "This is one"
  end
  module_function :one
end

class Cls
  include Mod
  def call_one
    one
  end
end

Mod.one     #=> "This is one"
c = Cls.new
c.call_one  #=> "This is one"

module Mod
  def one
    "This is the new one"
  end
end

Mod.one     #=> "This is one"
c.call_one  #=> "This is the new one"