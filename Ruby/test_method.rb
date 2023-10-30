class MyClass
  def initialize(value1, value2)
    @x = yield(value1, value2)
  end

  def ans_my_value
    @x
  end
end

object = MyClass.new(10, 20){|x, y| x * y}

met = object.method :ans_my_value

print(met.call)
