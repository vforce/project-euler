class OneStack
  def initialize(stacks)
    @no_stacks = stacks
    @stack = []
    @heads = []
    (0..stacks-1).each do |i|
      @heads << i
    end
  end

  def push(stack, x)
    head = @heads[stack] + @no_stacks
    if head > @stack.size
      @stack += [nil] * @stack.size
    end
    @stack[head] = x
    @heads[stack] = head
  end

  def pop(stack)
    return nil if @heads[stack] < @no_stacks
    res = @stack[@heads[stack]]
    @heads[stack] -= @no_stacks
    res
  end
end
