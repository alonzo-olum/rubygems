class Person
  attr_accessor :name, :friends, :visited

  def initialize(name)
    @name    = name
    @friends = []
    @visited = false
  end

  def add_friend(friend)
    @friends << friend
  end

  def network
    # track visited nodes, to reset attr
    to_reset = [self]
    # queue init w/ root
    queue = [self]
    self.visited = true

    while queue.any?
      # remove curr vertex from queue
      curr = queue.shift
      puts curr.name

      # add all friends to queue
      curr.friends.each do |friend|
        if !friend.visited
          to_reset << friend
          queue << friend
          friend.visited = true
        end
      end
    end
    # algo is complete, reset each node's visited
    # attr to false
    to_reset.each do |node|
      node.visited = false
  end
end

harry  = Person.new("Harry")
cory   = Person.new("Cory")
greg   = Person.new("Greg")
jorge  = Person.new("Jorge")

harry.add_friend(jorge)
jorge.add_friend(harry)

jorge.add_friend(cory)
cory.add_friend(jorge)

harry.add_friend(greg)
greg.add_friend(cory)

p harry.network()
