require './doublylinkedlist.rb'

class Queue
  attr_accessor :queue

  def initialize
    @queue = DoublyLinkedList.new
  end

  def enqueue(value)
    @queue.insert_at_end(value)
  end

  def deque
    removed_node = @queue.remove_at_front
    return removed_node.data
  end

  def tail
    return @queue.last_node.data
  end
end
