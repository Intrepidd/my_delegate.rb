module MyDelegate

  def self.extended(base)
    base.class_variable_set :@@_delegates, {}
  end

  def delegate(method, target)
    self.class_variable_get(:@@_delegates)[method] = target
    include ClassMethods
  end

  module ClassMethods

    def method_missing(method, *args, &block)
      target = self.class.class_variable_get(:@@_delegates)[method]
      if target
        self.instance_variable_get("@#{target}").send(method, *args, &block)
      else
        super
      end
    end

  end

end

Object.send(:extend, MyDelegate)

class Test

  attr_accessor :hash

  delegate :size, :hash
  delegate :each, :hash

end

t = Test.new

t.hash = {:foo => :bar, :hello => :world}

t.each do |key, value|
  puts "#{key} => #{value}"
end

puts t.size

t.hash = {:foo => :bar}

puts t.size
