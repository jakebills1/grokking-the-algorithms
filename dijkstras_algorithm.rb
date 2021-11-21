INFINITY = Float::INFINITY
def find_lowest_cost_node(costs, processed)
  lowest_cost = INFINITY
  lowest_cost_node = nil
  costs.each do |k, v|
    if v < lowest_cost && !processed.include?(k)
      lowest_cost = v 
      lowest_cost_node = k
    end
  end
  return lowest_cost_node
end

def main
  # setting up data structure representing graph
  graph = {}
  graph["start"]
  graph["start"] = {}
  graph["start"]["a"] = 6
  graph["start"]["b"] = 2
  graph["a"] = {}
  graph["a"]["fin"] = 1
  graph["b"] = {}
  graph["b"]["a"] = 3
  graph["b"]["fin"] = 5
  graph["fin"] = {}
  # starting costs table
  costs = {} 
  costs["a"] = 6
  costs["b"] = 2
  costs["fin"] = INFINITY
  # starting parents table
  parents = {}
  parents["a"] = "start"
  parents["b"] = "start"
  parents["fin"] = false 
  # keep track of nodes already processed
  processed = []
  # algorithm steps
  # find lowest cost node not already processed
  node = find_lowest_cost_node(costs, processed) # should be "b"
  # if node was not nil
  while node != nil 
    # find cost and neighbors
    cost = costs[node] # 2
    neighbors = graph[node] # { "a" => 3, "fin" => 5 } 
    # go through all neighbors of this node. 
    neighbors.each do |k, v|
      new_cost = cost + neighbors[k]
      if new_cost < costs[k]  # if its cheaper to get to this neighbor by going through this node update the cost for this node
        costs[k] = new_cost # it was cheaper to get to this node through the other node than from the start
        parents[k] = node # the node becomes teh new parent for this neighbor
      end
    end
    processed << node # mark the node as processed
    node = find_lowest_cost_node(costs, processed) # set a new node as the next lowest cost node
  end
  pp parents # => {"a"=>"b", "b"=>"start", "fin"=>"a"}
  # cheapest path is start, b, a, fin
end

main()