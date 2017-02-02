module MyQueue
  class Stack
    def initialize
      @stack = []
    end

    def push(x)
      @stack << x
    end

    def pop
      return nil if @stack.size==0
      @stack.pop
    end

    def peek
      return nil if @stack.size==0
      @stack[-1]
    end
  end

  class Queue
    def initialize
      @in = Stack.new
      @out = Stack.new
    end

    def enqueue(x)
      while @out.peek!=nil
        @in.push(@out.pop)
      end
      @in.push(x)
    end

    def dequeue
      while @in.peek!=nil
        @out.push(@in.pop)
      end
      @out.pop
    end
  end
end
