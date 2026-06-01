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
    queue = [self]
    self.visited = true

    while queue.any?
      curr = queue.shift
      puts curr.name

      curr.friends.each do |friend|
        if !friend.visited
          queue << friend
          friend.visited = true
        end
      end
    end
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
