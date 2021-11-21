def countdown(i)
  puts i 
  countdown(i - 1) unless i == 0 # recursion goes forever unless a base case is established; the recursive case is when 
end

countdown(5)