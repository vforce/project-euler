require 'min_stack'

describe 'test min stack' do
  def stack
    @stack ||= MinStack::Stack.new
  end
  it 'should push correctly' do
    stack.push_many(10.downto(1))
  end
  it 'should pop correclty' do
    stack.push_many(10.downto(1))
    (1..10).each {|x| stack.pop}
  end
  describe 'should find correct min' do
    it 'should find correct min when push descend' do
      stack.push_many(10.downto(1))
      expect(stack.min).to eq(1)
      stack.pop
      expect(stack.min).to eq(2)
      stack.pop
      expect(stack.min).to eq(3)
    end

    it 'should find correct min when push ascend' do
      stack.push_many(1..10)
      expect(stack.min).to eq(1)
      stack.pop
      expect(stack.min).to eq(1)
    end
  end
end
