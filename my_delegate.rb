module MyDelegate

  def delegate(method, target)
    class_eval <<-CODE
      def #{method}(*args, &block)
        #{target}.#{method}(*args, &block)
      end
    CODE
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
