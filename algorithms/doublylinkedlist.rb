require './node.rb'

# runtime complexity:
# inserting and deleting (front/end) is O(1)
class DoublyLinkedList

  attr_accessor :first_node, :last_node

  def initialize(first_node=nil, last_node=nil)
    @first_node = first_node
    @last_node = last_node
  end

  def insert_at_end(value)
    new_node = Node.new(value)
    # if the list is empty
    if !first_node
      @first_node = new_node
      @last_node = new_node
    else
      new_node.previous_node = @last_node
      @last_node.next_node = new_node
      @last_node = new_node
    end
  end

  def remove_at_front
    removed_node = @first_node
    @first_node = first_node.next_node
    # don't forget that previous_node of first_node is nil
    @first_node.previous_node = nil
    return removed_node
  end
end

# main executing block
node_1 = Node.new("one")
node_2 = Node.new("eight")

node_1.next_node = node_2
node_2.previous_node = node_1

node_3 = Node.new("seven")

node_2.next_node = node_3
node_3.previous_node = node_2

dlist = DoublyLinkedList.new(node_1, node_3)
dlist.insert_at_end("another one")

p dlist.last_node.previous_node.data

dlist.remove_at_front
p dlist.first_node.previous_node
