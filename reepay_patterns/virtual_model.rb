class VirtualModel
  # creates an instance method: say_hello=
  # creates an instance variable: @say_hello
  # @say_hello can be assigned by passing value to the setter Method
  # say_hello=('Hello world')
  # by default class methods are public, so say_hello can be invoked with public_send('say_hello=', 'hello world')
  attr_accessor :say_hello
  def assign_attributes
    public_send("say_hello=", "Good morning")
    puts @say_hello
  end
end

VirtualModel.new.assign_attributes