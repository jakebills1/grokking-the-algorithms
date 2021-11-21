require("pry")
# finds index of smallest item in array
def find_smallest(arr)
  smallest = arr[0] # setting initial values to beginning of array
  index = 0
  arr.each_with_index do |n, i|
    if n < smallest
      smallest = n
      index = i 
    end
  end
  index
end

# puts(1 == find_smallest([3,6,8,99,1])) # test for correctness
# puts(find_smallest([5, 4]))

def selection_sort(arr)
  out = []
  while !arr.empty? do
    smallest_index = find_smallest(arr) # will find next smallest item at next iteration and so forth
    out << arr.delete_at(smallest_index)
  end
  out
end

puts(selection_sort([5,3,1,2,4]))

# further challenge: do this in place ? 
