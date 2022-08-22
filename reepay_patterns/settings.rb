class Setting
  class << self
    def load_settings!
      [{
        recurrent: true,
        gateway: 'GC',
        currency: 'USD'
      }]
    end

    def create_settings
      config = self.load_settings!
      # instantiating the class internally
      @settings = config
        .map(&method(:new))
    end
  end

  def self.settings
    puts "hello"
    puts "#{@settings.inspect}"
    @settings
  end

  def initialize(rec, gateway, cur)
    @recurrent = rec
    @gateway = gateway
    @cur = cur
  end
end

puts Setting.settings