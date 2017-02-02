module MinStack
  class Node
    attr_accessor :x, :min
    def initialize(x, min)
      @x = x
      @min = min
    end
  end
  class Stack
    def initialize
      @stack = []
    end

    def peek
      return nil if @stack.size==0
      return @stack[-1]
    end

    def push(x)
      head = peek
      if head.nil? || head.min > x
        @stack << Node.new(x, x)
      else
        @stack.<< Node.new(x, head.min)
      end
    end

    def push_many(list)
      list.each do |x|
        push(x)
      end
    end

    def pop
      return nil if @stack.size==0
      @stack.pop
    end

    def min 
      return nil if @stack.size==0
      peek.min
    end
  end
end
