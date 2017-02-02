require 'one_array_three_stacks'

describe 'should work with 3 stacks on 1 array' do
  def stack
    @stack ||= OneStack.new(3)
  end
  it 'should push correctly' do
    stack.push(0, 1)
    stack.push(0, 2)
    stack.push(1, 100)
    stack.push(2, 1000)
  end

  it 'should pop correctly' do
    stack.push(0, 1)
    stack.push(1, 10)
    expect(stack.pop(0)).to eq(1)
    expect(stack.pop(0)).to be_nil
    expect(stack.pop(1)).to eq(10) 
    expect(stack.pop(2)).to be_nil
  end

  it 'should pop nicely' do
    (1..10).each do |i|
      stack.push(0, i)
      stack.push(1, i*2)
      stack.push(2, i*3)
    end
    expect(stack.pop(0)).to eq(10)
    expect(stack.pop(1)).to eq(20)
    expect(stack.pop(2)).to eq(30)
  end
end
