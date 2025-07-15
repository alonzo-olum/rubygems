# search_insert illustrates the 
# idea of search and insert in an array
# TODO: move other elements to the right
def search_insert(array, value)
  lower = 0
  for index in 0..array.length-1
    if value > array[index]
      lower = lower + 1
    elsif value < array[index]
      temp = array[index-1]
      array[index-1] = value
    else
      #do nothing
    end
  end
  return array
end

def binary_search(array, value)
  # First establish the lower and upper bounds
  # First and last values respectively

  lower_bound = 0
  upper_bound = array.length - 1

   while lower_bound <= upper_bound do
     print "lower_bound: ", lower_bound, " upper_bound: ", upper_bound, "\n"
     # get the midpoint of the array
     midpoint = (lower_bound + upper_bound) / 2
     print "midpoint: ", midpoint, "\n"

     # We inspect the value at the midpoint
     midpoint_value = array[midpoint]
     print "midpoint_value: ", midpoint_value, "\n"

     # If midpoint_value is not our value
     # We then change the lower_bound or upper_bound
     # based on whether we need to move lower/upper

     if value < midpoint_value
       upper_bound = midpoint - 1
       print value, " < ", midpoint_value, "\n" 
     elsif value > midpoint_value
       lower_bound = midpoint + 1
       print value, " > ", midpoint_value, "\n" 
     elsif value == midpoint_value
       print value, " = ", midpoint_value, "\n" 
       return midpoint
     end
   end

   # After the entire scan, bounds reach each other
   # Meaning our value is not contained in the array
   return nil
end

some_array = [ 16, 4, 7, 1, 5, 10, 23, 18, 19, 8, 9, 2, 3]
some_value = 16
sorted_array = some_array.sort
print binary_search(sorted_array, some_value), "\n"
print search_insert(sorted_array, 20)
