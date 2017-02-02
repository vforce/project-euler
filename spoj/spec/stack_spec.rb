require 'stack'

describe 'stack' do
  def stack
    @stack ||= Stack.new
  end

  it 'should init' do
    stack = Stack.new
  end

  it 'size = 0 when empty' do
    expect(Stack.new.size).to eq(0)
  end

  it 'should push' do
    stack.push(1)
    expect(stack.size).to eq(1)
  end

  describe 'should peek' do
    it 'should return nil when empty' do
      expect(stack.peek).to be_nil
    end
    it 'should return top data' do
      stack.push(1)
      stack.push(3)
      expect(stack.peek).to eq(3)
    end
  end

  describe 'should pop' do
    it 'should return nil when empty' do
      expect(stack.pop).to be_nil
    end
    it 'should be empty once popped everything' do
      expect(stack.push(1).pop).to eq(1)
      expect(stack.size).to eq(0)
    end
    it 'should reduce stack size by 1' do
      expect(stack.push(1).push(2).pop).to eq(2)
      expect(stack.size).to eq(1)
    end
  end
end
