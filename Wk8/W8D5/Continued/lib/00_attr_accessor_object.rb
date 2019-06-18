class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |ele|
      define_method(ele) do 
        instance_variable_get("@#{ele}")
      end

      define_method("#{ele}=") do |value|
        instance_variable_set("@#{ele}", value)
      end
    end
  end
end
