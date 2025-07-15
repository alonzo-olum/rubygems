 class Linter
  attr_reader :error

  def initialize
    # We use a simple array as our empty stack
    @stack = []
  end

  def lint(text)
    # We read each character off our array
    text.each_char.with_index do |char, index|
      if opening_brace?(char)
        # If character is an opening brace, we push into stack
        @stack.push(char)
      elsif closing_brace?(char)
        if closes_most_recent_opening_brace?(char)
          @stack.pop
        else
          @error = "Incorrect closing brace: #{char} at index #{index}"
          return
        end
      end
    end

    if @stack.any?
      # If we get to end of line and stack is not empty,
      # It means we have an unaccompanied opening brace
      @error = "#{@stack.last} does not have a closing brace"
    end
  end
  private

  def opening_brace?(char)
    ['(', '{', '['].include?(char)
  end

  def closing_brace?(char)
    [')', '}', ']'].include?(char)
  end

  def opening_brace_of(char)
    {')'=>'(', '}'=>'{', ']'=>'['}[char]
  end

  def most_recent_opening_brace
    @stack.last
  end

  def closes_most_recent_opening_brace?(char)
    opening_brace_of(char) == most_recent_opening_brace
  end
end

linter = Linter.new
linter.lint("(var x = { y: [2,4,6] })")
puts linter.error

