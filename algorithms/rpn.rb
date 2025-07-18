class RPN
  attr_reader :error

  def initialize
    #initialize a new array
    @stack = []
  end

  def rpn()
    ARGV.each do | value |
      if is_operator?(value)
        #expect stack to have atleast 2 elements
        #throw error instead
        if is_stack_less?
          @error = "Incorrect format: #{value} an operator not preceded by atleast 2 values"
        else
          compute_result(value)
        end
      #we want to do this for only numerics
      #we can throw an error on else
      elsif Integer(value).is_a?(Numeric)
        #before we insert we expect at most one element
        if is_stack_more?
          @error = "Incorrect format: #{value} expects an operator "
        else
          @stack.push(value)
        end
      end
    end
  end

  #get last computed value
  def result
    @stack.last
  end

  private
  def is_operator?(value)
    ['+', '-', '*', '/'].include?(value)
  end

  # compute stack elements with operator
  def compute_result(op)
    arg2 = @stack.pop
    arg1 = @stack.pop
    result = Integer(arg1).method(op).(Integer(arg2))
    @stack.push(result)
  end

  #stack has less than two elements
  def is_stack_less?
    @stack.size < 2
  end

  #stack more than one element
  def is_stack_more?
    @stack.size > 1
  end
end

# main block execution
  r = RPN.new
  r.rpn()
  puts r.result
  puts r.error
