class MyClass
  @value2 = 111

  def self.read
    @value2
  end

  def read
    @value2
  end

  def wirte
    @value2 = 1192
  end

end

obj = MyClass.new
obj.wirte
puts obj.read
puts MyClass.read
  
