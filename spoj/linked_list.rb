class Node
  attr_accessor :next, :data
  def initialize(data)
    @next = nil
    @data = data 
  end

  def size
    count = 0
    node = self
    while !node.nil?
      count += 1
      node = node.next
    end
    count
  end

  def to_s
    result = ''
    node = self
    while node!=nil
      result += node.data.to_s + ' '
      node = node.next
    end
    result.strip
  end

  def remove_unsorted_duplicated_2
    head = self
    while head!=nil
      prev = head
      node = head.next
      while node!=nil
        if head.data==node.data
          prev.next = node.next
        else
          prev = prev.next
        end
        node = node.next
      end
      head = head.next
    end
    return self
  end

  def remove_unsorted_duplicated_1
    values = {data => true}
    node = self
    while node!=nil && node.next != nil
      d = node.next.data
      if values[d] != nil
        node.next = node.next.next
      else
        values[d] = true
        node = node.next
      end
    end
    self
  end

  def self.from_list(l)
    if l.size < 1
      return nil
    else
      head = nil
      l.each_with_index do |a, i|
        if i==0
          head = Node.new(a)
        else
          head.append(a)
        end
      end
      head
    end
  end

  def append(d)
    node = self
    while !node.next.nil?
      node = node.next
    end
    node.next = Node.new(d)
    return self
  end

  def delete_node(d)
    if data == d
      @next
    else
      node = self
      while !node.next.nil?
        if node.next.data == d
          node.next = node.next.next
          return self
        end
        node = node.next
      end
      return self
    end
  end
end
