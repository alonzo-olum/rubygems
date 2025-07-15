
def copy_other_elem(array)
  other_array = []
  array.each_with_index do |element, index|
    other_array << element if index.even?
  end

  return other_array
end

array = [2, 5, 4, 1, 7, 0, 3]
print copy_other_elem(array)
