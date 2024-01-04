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
  attr_accessor :root

  def initialize(arr)
    @arr = arr.sort.uniq # clean the array
    @root = build_tree(@arr)
    @size = 0
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
    curr_node = node
    return Node.new(value) if curr_node.nil?

    until curr_node.nil?
      prev_node = curr_node
      value < curr_node.data ? curr_node = curr_node.left : curr_node = curr_node.right
    end

    value < prev_node.data ? prev_node.left = Node.new(value) : prev_node.right = Node.new(value)
    @size += 1
  end

  def find_min(node = @root)
    # check for the left most node
    return nil if node.nil?

    return node if node.left.nil?

    find_min(node.left)
  end

  def find_max(node = @root)
    return nil if node.nil?

    return node if node.right.nil?

    find_max(node.right)
  end

  def contain?(value, node = @root)
    return false if node.nil?
    if value < node.data
      return contain?(value, node.left)
    elsif value > node.data
      return contain?(value, node.right)
    else
      return true
    end
  end

  def delete(value, node = @root)
    remove_node(value, node = @root)
    @size -= 1
  end

  def remove_node(value, node = @root)
    # using an external method to sav size decreases
    return nil if node.nil?

    if node.data > value
      node.left = remove_node(value, node.left)
    elsif node.data < value
      node.right = remove_node(value, node.right)
    else
      if !node.left.nil? && !node.right.nil?
        min_of_right = find_min(node.right)
        node.data = min_of_right.data
        node.right = remove_node(min_of_right.data, node.right)
      elsif !node.left.nil?
        node = node.left
      elsif !node.right.nil?
        node = node.right
      else
        node = nil
      end
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
puts "Left most: #{tree.find_min}"
puts "contains '8' = #{tree.contain?(8)}"
tree.delete(4)
tree.delete(9)
tree.pretty_print
