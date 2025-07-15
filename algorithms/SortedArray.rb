class SortedArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def partition!(left_pointer, right_pointer)

    # We always choose the right-most element as pivot
    pivot_position = right_pointer
    pivot = @array[pivot_position]

    # We start the right pointer left of the pivot
    right_pointer -= 1

    while true do
      while @array[left_pointer] < pivot do
        left_pointer += 1
      end

      while @array[right_pointer] > pivot do
        right_pointer -= 1
      end

      if left_pointer >= right_pointer
        break
      else
        swap(left_pointer, right_pointer)
      end
    end

    # As a final step we swap the left_pointer with the pivot
    swap(left_pointer, pivot_position)

    # We return the left_pointer to be used in Quicksort Algo
    return left_pointer
  end

  def swap(pointer_1, pointer_2)
    temp_value = @array[pointer_1]
    @array[pointer_1] = @array[pointer_2]
    @array[pointer_2] = temp_value
  end

  def quicksort!(left_index, right_index)
    # Base case where the sub-array is 0 or 1
    if right_index - left_index <= 0
      return
    end
    # Partition array and return the pivot
    pivot_position = partition!(left_index, right_index)

    # Recursively call the quicksort on whatever is left of pivot
    quicksort!(left_index, pivot_position-1)

    # Recursively call the quicksort on whatever is right of pivot
    quicksort!(pivot_position+1, right_index)
  end
end

def quickselect!(kth_lowest_val, left_idx, right_idx)
  # on the base case; subarray = 1
  # we have the val
  if right_idx - left_idx <= 0
    return @array[left_idx]
  end
  # Partition the array and grab the pivot
  pivot_position = partition!(left_idx, right_idx)
  if kth_lowest_val < pivot_position
    quickselect!(kth_lowest_val, left_idx, pivot_position-1)
  elsif kth_lowest_val > pivot_position
    quickselect!(kth_lowest_val, pivot_position+1, right_idx)
  else
    #kth_lowest_val == pivot_position
    #if after partition the pivot_position is in the same spot
    #as the kth_lowest_val, we've found the value
    return @array[pivot_position]
  end
end

# Main Sorting Entry Block
arr = [9, 5, 2, 6, 8, 1, 3, 4, 0]
sorted_arr = SortedArray.new(arr)
sorted_arr.quicksort!(0, arr.length-1)
p sorted_arr.array
