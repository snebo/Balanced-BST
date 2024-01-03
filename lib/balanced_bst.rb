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
    @arr = arr.sort.uniq # clean the array
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

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if value < node.data
      node.left = insert(value, node.left)
    elsif value > node.data
      node.right = insert(value, node.right)
    end
    node
  end
end

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7]
tree = Tree.new(arr)
tree.pretty_print
tree.insert(6)
tree.insert(20)
tree.pretty_print
