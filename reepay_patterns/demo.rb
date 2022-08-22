class Provisioner
  class << self
    def walk=(s)
      puts s
    end
  end

  # refers to Provisioner.walk=() Method
  self.walk = 'five steps'
  
  def initialize
    # self inside an instance method refers to the instance
    self.speak = 'Hello Provisioner'
  end

  def speak=(word)
    puts word
  end
end

Provisioner.new
