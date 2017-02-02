require 'linked_list'

class Stack
  def initialize
    @node = nil
  end

  def push(x)
    if @node == nil
      @node = Node.new(x)
    else
      @node.next = Node.new(x)
    end
    self
  end

  def pop
    return nil if @node.nil?
    if @node.next.nil?
      data = @node.data
      @node = nil
      return data
    else
      prev = node = @node
      while node.next != nil
        prev = node
        node = node.next
      end
      prev.next = nil
      node.data
    end
  end

  def peek
    return nil if @node.nil?
    node = @node
    while node.next!=nil
      node = node.next
    end
    node.data
  end

  def size
    @node.nil? ? 0: @node.size
  end
end
