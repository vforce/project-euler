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

  def partition(x)
    node = self
    head_less = Node.new(0)
    head_more = Node.new(0)
    while node!=nil
      if node.data<x
        head_less.append(Node.new(node.data))    
      else
        head_more.append(Node.new(node.data))
      end
      node = node.next
    end
    head_more = head_more.next
    head_less = head_less.next
    head_less.append(head_more)
    head_less
  end

  def partition!(x)
    node_more = head_more = Node.new(0)
    node_less = head_less = Node.new(0)
    node = self
    while node!=nil
      if node.data<x
        node_less.next = node
        node_less = node
      else
        node_more.next = node
        node_more = node
      end
      node = node.next
    end
    head_less = head_less.next
    head_more = head_more.next
    node_less.next = head_more
    return head_less
  end

  def reverse!
    node = nex = self
    prev = nil
    while node!=nil
      nex = node.next
      node.next = prev
      prev = node
      if nex == nil
        return node
      end
      node = nex
    end
  end

  def reverse_sum(other)
    (self.reverse! + other.reverse!).reverse!
  end

  def is_parlindrome
    self.to_s == self.reverse!.to_s
  end

  def detect_circle
    seen = {}
    node = self
    while node!= nil
      if seen[node.object_id] !=nil
        return node
      else
        seen[node.object_id] = true
      end
      node = node.next
    end
  end


  def +(other)
    return self if other.nil?
    carry = 0
    node_other = other
    node = self
    head_res = res = Node.new(0)
    while true
      if node.nil? && node_other.nil?
        if carry > 0
          res.next = Node.new(carry) 
        end
        return head_res.next
      end
      s = (node.nil? ? 0  : node.data) +
        (node_other.nil? ? 0 : node_other.data) +
        carry
      carry = s/10
      res.next = Node.new(s%10)
      res = res.next
      node = node.next if node!=nil
      node_other = node_other.next if node_other!=nil
    end
  end

  #1 2 3 4 5  => 3 (remains 1 2 4 5)
  #1 2 3 4 5 6 => 4 (remains 1 2 3 5 6)
  def remove_middle
    prev = head = node = self
    while node!=nil
      if node.next.nil?
        break
      end
      prev = head
      head = head.next
      node = node.next.next
    end
    prev.next = head.next
    head.data
  end

  #find the kth element from last
  def find_k_element(k)
    return self if k<1 
    node = head = self
    (1..k-1).each do |i|
      if node.nil?
        return nil
      else
        node = node.next
      end
    end
    while node.next!=nil
      head = head.next
      node = node.next
    end
    return head
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
          prev = prev.next #only move prev if node is not removed
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
        node.next = node.next.next #do not move node if it's not removed
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
