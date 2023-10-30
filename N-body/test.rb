class vec3
   @x = 1
   @y = 1
   @z = 1

        def vec_method_gen :method_name:
        define_method :method_name do |a, b|
                c.x = a.x :method_name b.x
                c.y = a.y :method_name b.y
                c.z = a.z :method_name b.z 
        end
        end

  vec_method_gen :+
end

vec3 a, b, c

c = a + b
