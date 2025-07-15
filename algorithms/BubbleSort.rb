
def bubble_sort(array)
  unsorted_until_index = array.length - 1
  sorted = false
  while !sorted do
    sorted = true
    for index in 0...unsorted_until_index
      if array[index] > array[index+1]
        sorted = false
        array[index], array[index+1] = array[index+1], array[index]
      end
    end
    unsorted_until_index = unsorted_until_index - 1
   end
end
# This is here just to highlight the improvement made to the code
# And what to avoid in future
   # array.each_with_index do |element, index|
   #   if index < array.length - 1 && element > array[index+1]
   #     sorted = false
   #     array[index], array[index+1] = array[index+1], array[index]
   #   end
   # end

  list = [65, 55, 45, 35, 25, 15, 10]
  bubble_sort(list)
  print list, "\n"
