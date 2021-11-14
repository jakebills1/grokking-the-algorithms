def binary_search(list, item)
  low = 0 # defines range of list search
  high = list.size - 1
  num_guesses = 0
  while low <= high # while not narrowed down to one element
    midpoint = (low + high) / 2 # find midpoint of range currently being searched
    guess = list[midpoint] # make guess
    num_guesses += 1
    if guess == item # correct guess
      puts "num guesses: #{num_guesses}"
      return guess
    elsif guess > item # guess too high
      high = midpoint + 1
    else # guess too low
      low = midpoint + 1
    end
  end
  return nil
end
