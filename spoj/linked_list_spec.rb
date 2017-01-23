require './linked_list'

describe 'linked list should work correctly' do
  def node
    @node ||= Node.new(1)
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

  it 'remove unsorted linked list' do
    node = Node.from_list(%w[1 1 1])
    node.remove_unsorted_duplicated_1
    expect(node.size).to eq(1)
    node = Node.from_list(%w[1 2 3 4 3 4 2])
    node.remove_unsorted_duplicated_1
    expect(node.size).to eq(4)
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
end
