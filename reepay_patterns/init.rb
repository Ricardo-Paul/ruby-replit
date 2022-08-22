class VirtualModel
  def initialize(attributes={})
    # because attributes has a default value here,
    # assign_attributes will always run whenever we initialize
    # but no attrs will be assigned because the hash is empty
    # that is why we call it explicitly call assign_attributes after
    # which causes assign_attributes to be called twice
    assign_attributes if attributes
  end

  def assign_attributes
    puts "Assign attributes on init"
  end
end

class Signup < VirtualModel
end

Signup.new