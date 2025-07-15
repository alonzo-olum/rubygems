
def linear_search(array, value)
  array.each do |element|

    # if we find the value we return it;
    if element == value
      return value

    # if we reach an element that is greater than value
    # we can exit the loop early
    elsif element > value
      break
    end
  end

  # we return nil as we did not find the value
  return nil
end

some_array = [3, 5, 6, 2, 4, 9]
some_value = 3
print linear_search(some_array, some_value), "\n"
