class Student
        attr_accessor :name, :student_id, :age
end
me = Student.new()
me.name = "ryuki"
#puts me.name
me.student_id = 1280076
#puts me.student_id
me.age = 21
#puts me.age
puts me.instance_variables

def print_attr(st)
 st.instance_variables.each do |v|
   puts st.instance_variable_get(v)
  end
end
print_attr me


class MyClass
  def self.my_method; end
end

def MyClass.my_other_method; end

class MyClass
  class << self
    def my_method; end
  end
end




