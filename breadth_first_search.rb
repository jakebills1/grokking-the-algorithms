# problem: finding which of your friends, or your friends' friends, are a mango seller
# algo
# keep a queue of people to check
# dequeue a person off the queue
# if they have not already been checked, check them
# if they were the mango seller, its done
# if they were not, add their friends to the queue of people to check
g = {}
g["you"] = ["alice", "bob", "claire"]
g["bob"] = ["anuj", "peggy"]
g["alice"] = ["peggy"]
g["claire"] = ["thom", "jonny"]
g["anuj"] = []
g["peggy"] = []
g["thom"] = []
g["jonny"] = []


def b_first_search(start, graph)
  to_search = Queue.new
  already_searched = []
  graph[start].each do |v|
    to_search.enq(v)
  end
  until to_search.empty?
    current_person = to_search.deq
    if !already_searched.include?(current_person) && is_mango_seller(current_person)
      puts("#{current_person} was the mango seller")
      break
    else
      already_searched << current_person
      graph[current_person].each do |v|
        to_search.enq(v)
      end
    end
  end
  puts "mango seller not found"
end

def is_mango_seller(name)
  name.end_with? "m"
end

b_first_search("you", g)