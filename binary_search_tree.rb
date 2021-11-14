class Node
  attr_reader :value
  attr_accessor :left, :right
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def terminal?
    @left == nil && @right == nil
  end
end

def push_node(node, value)
  # if value is greater than value stored in node, value goes right
  # else value goes left
  if value > node.value
    if node.right
      push_node(node.right, value) # there is already a right node to teh current node, so we need to traverse tree more until a place to put value can be found
    else
      node.right = Node.new(value) # there is empty spot for value at current nodes right node
    end
  else
    if node.left
      push_node(node.left, value)
    else
      node.left = Node.new(value)
    end
  end
end

def traverse_right(node)
  return if node.nil?
  if node.right
    traverse_right(node.right)
  end
  puts node.value
  if node.left
    traverse_right(node.left)
  end
end

def traverse_left(node) # aka postorder
  return if node.nil?
  if node.left
    traverse_left(node.left)
  end
  puts node.value
  if node.right
    traverse_left(node.right)
  end
end

# testing
#
arr = [5,6,2,4,1,8,7,9,3]
root = Node.new(arr.shift)
arr.each do |n|
  push_node(root, n)
end

puts "right traverse:\n"
traverse_right(root)
puts "left traverse:\n"
traverse_left(root)

