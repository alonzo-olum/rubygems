class Quicksort
  def quicksort(left_index, right_index)
    # Base case where the sub-array is 0 or 1
    if right_index - left_index <= 0
      return
    end
    # Partition array and return the pivot
    pivot_position = partition(left_index, right_index)

    # Recursively call the quicksort on whatever is left of pivot
    quicksort(left_index, pivot_position-1)

    # Recursively call the quicksort on whatever is right of pivot
    quicksort(pivot_position+1, right_index)
  end

