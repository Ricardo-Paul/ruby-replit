class VirtualModel
  def _assign_attr
    if respond_to?(:first_name)
      puts "#{:first_name.to_s} exist on #{self.class}"
    else 
      puts "Error"
    end
  end
end

class Signup < VirtualModel
  def first_name
  end 
end

Signup.new._assign_attr