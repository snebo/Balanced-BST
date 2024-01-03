# frozen_string_literal: true

# stores node data for the BTS
class Node
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end 

# Tree: handles the bst logic
class Tree
  def initialize(arr)
    @arr = arr
    @root = build_tree(@arr)
  end
  
  def build_tree(arr)
    return nil if arr.empty?
    return Node.new(arr.first) if arr.length == 1

    mid = arr.length / 2
    root_node = Node.new(arr[mid])
    root_node.left = build_tree(arr.take(mid))
    root_node.right = build_tree(arr.drop(mid + 1))

    root_node
  end
end

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7]
tree = Tree.new(arr)