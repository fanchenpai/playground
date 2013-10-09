class Parent
  @instance_var = 'parent'
  def print_var
    puts @instance_var
  end
end

class Child < Parent
  def initialize
    @instance_var = 'child'
  end
end

c.print_var
p.print_var # won't print anything