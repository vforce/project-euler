require './queue'

describe 'queue' do
  def queue
    @queue ||= Queue.new
  end

  it 'should have correct size' do
    expect(queue.size).to eq(0)
  end

  describe 'should enqueue' do
    it 'should add' do
      queue.enqueue(1)
      expect(queue.size).to eq(1)
      queue.enqueue(2)
      expect(queue.size).to eq(2)
    end
  end

  describe 'should dequeu' do
    it 'should return nil when empty' do
      expect(queue.dequeue).to eq(nil)
    end

    it 'should dequeue the last element' do
      queue.enqueue(2)
      queue.enqueue(1)
      expect(queue.dequeue).to eq(2)
    end
  end
end
