def setter_test
  @x = 10
end

def print_value
  puts @x
end

env = Object.new
env.instance_eval &setter_test 
env.instance_eval &print_value


