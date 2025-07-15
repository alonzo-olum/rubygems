
def copy_other_elem(array)
  other_array = []
  index = 0

  while index < array.length
    other_array << array[index]
    index += 2
  end

  return other_array
end

array = [5, 9, 3, 2]
print copy_other_elem(array)

