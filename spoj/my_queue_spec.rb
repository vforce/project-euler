require './my_queue'

describe 'my queue' do
  describe 'should work correctly' do
    def queue
      @queue ||= MyQueue::Queue.new
    end

    it 'should enqueue correclty' do
      (1..100).each do |x|
        queue.enqueue(x)
      end
    end

    it 'should dequeue correctly' do 
      (1..100).each do |x|
        queue.enqueue(x)
      end
      expect(queue.dequeue).to eq(1)
      expect(queue.dequeue).to eq(2)
      expect(queue.dequeue).to eq(3)
    end
  end
end
