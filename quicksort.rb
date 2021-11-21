# base case: an array with 1 element or that is empty does not need to be sorted
# arrays of 2 elements can be easily sorted by comparing the two elements
# fro arrays larger than two
# pick the pivot and partition the remaining numbers into an array of those less than the pivot and an array of those more than the pivot
# call quicksort on each subarray

def quicksort(arr) # assuming arr has no duplicates
  if arr.length < 2
    puts("arr: #{arr}")
    return arr # is already sorted
  else
    pivot = arr.first
    puts("pivot: #{pivot}")
    less_than_pivot = arr.filter { |n| n < pivot }
    puts("lt: #{less_than_pivot}")
    greater_than_pivot = arr.filter { |n| n > pivot }
    puts("gt: #{greater_than_pivot}")
    return quicksort(less_than_pivot) | [pivot] | quicksort(greater_than_pivot)
  end
end


puts quicksort([10, 5, 2, 3]).inspect # => [2,3,5,10]