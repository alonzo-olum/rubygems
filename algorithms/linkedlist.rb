require './node.rb'

# runtime complexity:
#                   indexing:  O(n)
#                   searching: O(n)
#                   insertion start: O(1)
#                   deletion start:  O(1)
class LinkedList
  attr_accessor :first_node

  def initialize(first_node)
    @first_node = first_node
  end

  def read(index)
    #we begin at the first node of the list
    current_node = first_node
    current_index = 0

    while current_index < index do
      # we keep following the links of each current node
      current_node = current_node.next_node
      current_index += 1
      # if we are past the list, return nil
      return nil unless current_node
    end
    return current_node.data
  end

  def index_of(value)
    current_node = first_node
    current_index = 0

    begin
      # we found the value we were searching
      if current_node.data == value
        return current_index
      end

      current_node = current_node.next_node
      current_index += 1
    end while current_node
    # we get through the entire list no data
    return nil
  end

  def insert_at_index(index, value)
    # create a new node
    new_node = Node.new(value)
    # inserting at beginning of list
    if index == 0
      new_node.next_node = first_node
      self.first_node = new_node
    else
      current_node = first_node
      current_index = 0
      # we iterate from the first node to index
      while current_index < index-1 do
        current_node = current_node.next_node
        current_index += 1
      end
    end
      # at this point we are at desired index
      # we have the new node link to the next node
      new_node.next_node = current_node.next_node
      # we modify previous node to point to new_node
      current_node.next_node = new_node
    end

  def delete_at_index(index)
    # delete start node
    if index == 0
      self.first_node = first_node.next_node
    else
      current_node = first_node
      current_index = 0

      # we find the node just before index
      # delete and call it current_node
      while current_index < index-1 do
        current_node = current_node.next_node
        current_index += 1
      end
      # node that is after the one to delete
      node_after_del = current_node.next_node.next_node

      #change the link to point to node_after_del
      current_node.next_node = node_after_del
    end
  end
end

node_1 = Node.new("one")
node_2 = Node.new("eight")

node_1.next_node = node_2

node_3 = Node.new("seven")

node_2.next_node = node_3

node_4 = Node.new("six")

list = LinkedList.new(node_1)

p list.read(1)
p list.index_of("eight")

list.insert_at_index(2, node_4)
list.delete_at_index(2)

p list.read(2)
