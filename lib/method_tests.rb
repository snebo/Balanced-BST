# frozen_string_literal: true

require './method_tests'

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
puts "'8' is : #{tree.find(8)}"
p tree.in_order_travel
p tree.post_order_travel
p tree.level_order
p tree.pre_order_travel
puts "The node's height is:#{tree.height}"
puts "Node depth: #{tree.depth}"
tree.delete(6)
tree.delete(8)
tree.delete(23)
tree.pretty_print
puts "Is the node balanced: #{tree.balanced?}"
tree.rebalance
tree.pretty_print
