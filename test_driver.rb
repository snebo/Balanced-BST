require './lib/balanced_bst'

test = Tree.new(Array.new(15) { rand(1..100)})
test.pretty_print # visually draw the tree
p test.balanced?
puts "lever order: #{test.level_order.inspect}"
puts "pre order:#{test.pre_order_travel.inspect}"
puts "inorder: #{test.in_order_travel.inspect}"
puts "post order:#{test.post_order_travel.inspect}"
7.times { test.insert(rand(100..300)) }
test.pretty_print
test.balanced?
test.rebalance
test.pretty_print
test.balanced?
puts "lever order: #{test.level_order.inspect}"
puts "pre order:#{test.pre_order_travel.inspect}"
puts "inorder: #{test.in_order_travel.inspect}"
puts "post order:#{test.post_order_travel.inspect}"
