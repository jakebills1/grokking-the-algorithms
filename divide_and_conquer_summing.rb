def d_and_c_sum(list, running_total = 0)
  if list.empty?
    return 0
  elsif list.length == 1
    return list[0] + running_total
  else
    return d_and_c_sum(list, list.pop + running_total)
  end
end

puts d_and_c_sum([1,2,3,4,5]) # => 15
puts d_and_c_sum([5,4,3,2,1])
puts(d_and_c_sum([]) == 0)
puts(d_and_c_sum([1]) == 1)