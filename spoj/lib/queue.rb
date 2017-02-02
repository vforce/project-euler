require 'linked_list'

class Queue
  def initialize
    @node = nil
  end

  def enqueue(x)
    node = Node.new(x)
    node.next = @node
    @node = node
  end

  def dequeue
    return nil if @node.nil?
    prev = node = @node
    while node.next!=nil
      prev = node
      node = node.next
    end
    prev.next = nil
    node.data
  end

  def size
    return 0 if @node.nil?
    count = 0
    node = @node
    while node!=nil
      node = node.next
      count += 1
    end
    count
  end
end
