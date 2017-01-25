require './linked_list'

describe 'linked list should work correctly' do
  def node
    @node ||= Node.new(1)
  end
  def from_list
    return Node.from_list(list.map {|x| x.to_i})
  end
  def from_str(list)
    return Node.from_list(list.split.map {|x| x.to_i})
  end
  def sum_str(str1, str2)
    return from_str(str1) + from_str(str2)
  end
  it 'should initialize correctly' do
    expect(node.next).to be_nil
    expect(node.data).to be(1)
  end

  it 'should show correct size' do
    node = Node.new(1)
    expect(node.size).to eq(1)
    node.append(2)
    expect(node.size).to eq(2)
  end

  it 'should create a linked list from list' do
    node = Node.from_list(%w[1 2 4 5 4 6])
    expect(node.data).to eq('1')
    expect(node.size).to eq(6)
    expect(node.next.next.data).to eq('4')
  end

  it 'should print string correctly' do
    node = Node.from_list(%w[1 2 4 3])
    expect(node.to_s).to eq('1 2 4 3')
  end

  it 'remove unsorted linked list without using extra data' do
    node = Node.from_list(%w[1 1 1])
    node.remove_unsorted_duplicated_2
    expect(node.size).to eq(1)
    node = Node.from_list(%w[1 1 2 3 4 3 4 2])
    node.remove_unsorted_duplicated_2
    expect(node.size).to eq(4)
  end

  it 'should locate the kth element from last correctly' do
    node = Node.from_list(%w[1 2 3 4 3 4 2])
    expect(node.find_k_element(1).data).to eq('2')
    expect(node.find_k_element(4).data).to eq('4')
    expect(node.find_k_element(100)).to be_nil
  end

  it 'should remove the middle element' do
    node = Node.from_list(%w[1 2 3 4 5])
    expect(node.remove_middle).to eq('3')
    expect(node.size).to eq(4)
    expect(node.next.next.data).to eq('4')
    node = Node.from_list(%w[1 2 3 4 5 6])
    expect(node.remove_middle).to eq('4')
    expect(node.size).to eq(5)
    expect(node.next.next.next.data).to eq('5')
  end

  it 'remove unsorted linked list' do
    node = Node.from_list(%w[1 1 1])
    node.remove_unsorted_duplicated_1
    expect(node.size).to eq(1)
    node = Node.from_list(%w[1 2 3 4 3 4 2])
    node.remove_unsorted_duplicated_1
    expect(node.size).to eq(4)
  end

  describe 'it should do partition correctly' do
    it 'should partition correctly' do
      expect(from_str('3 5 2 1 6').partition(4).to_s).to eq('3 2 1 5 6')
    end

    it 'should partition! correctly' do
      expect(Node.new(1).partition!(4).to_s).to eq('1')
      expect(from_str('3 5 2 1 6').partition!(4).to_s).to eq('3 2 1 5 6')
    end
  end

  describe 'it should do sum correctly' do
    it 'should do sum in normal order correctly' do
      expect(from_str('6 1 7').reverse_sum(from_str('2 9 5')).to_s).to \
        eq('9 1 2')
      expect(from_str('1 1').reverse_sum(from_str('9 9 9')).to_s).to \
        eq('1 0 1 0')
    end

    it 'should do sum correctly when saved in reversed order' do
      expect(sum_str('7 1 6', '5 9 2').to_s).to eq('2 1 9')
      expect(sum_str('1 1', '9 9 9').to_s).to eq('0 1 0 1')
      expect(sum_str('0', '9 9 9').to_s).to eq('9 9 9')
    end
  end

  it 'should reverse correctly' do
    expect(from_str('1 2 3').reverse!.to_s).to eq('3 2 1')
  end

  it 'shoud check for palindrome correctly' do
    expect(from_str('1 2 3 2 1').is_parlindrome).to be(true)
  end

  it 'should append correctly' do
    expect(node.append(2)).to be(node)
    expect(node.next).not_to be_nil
    expect(node.next.data).to be(2)
    expect(node.next.next).to be_nil
  end

  describe 'should delete node correctly' do 
    it 'should delete itself' do
      expect(node.delete_node(1)).to be_nil
    end
    it 'should delete a node at the end' do
      node.append(2)
      expect(node.delete_node(2)).to be(node)
      expect(node.next).to be_nil
    end
    it 'should delete a node in between' do
      node.append(2)
      node.append(3)
      expect(node.delete_node(2)).to be(node)
      expect(node.next.data).to be(3)
      expect(node.next.next).to be(nil)
    end
  end

  it 'should detect circular correctly' do
    node = Node.new(0)
    a = Node.new(1)
    b = Node.new(2)
    c = Node.new(3)
    node.next = a
    a.next = b
    b.next = c
    c.next = a
    expect(a.detect_circle).to be(a)

    a = Node.new(1)
    b = Node.new(2)
    a.next = b
    b.next = a
    expect(a.detect_circle).to be(a)
  end
end
