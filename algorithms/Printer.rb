class PrintManager

  def initialize
    @queue = []
  end

  def queue_print_job(document)
    @queue.push(document)
  end

  def run
    while @queue.any?
      # while we have stuff in queue
      # shift to return the first element
      print(@queue.shift)
    end
  end

  private
  def print(document)
    # To be print the actual document
    # We have all of that logic here
    puts document
  end
end

# Main Block
#
print_manager = PrintManager.new 
print_manager.queue_print_job("First Doc")
print_manager.queue_print_job("Second Doc")
print_manager.queue_print_job("Third Doc")
print_manager.run
