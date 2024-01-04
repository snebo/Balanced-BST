# Balanced-BST
 Balanced Binary Sort Tree

 ## Task
 You’ll build a balanced BST in this assignment. Do not use duplicate values because they make it more complicated and result in trees that are much harder to balance. Therefore, be sure to always remove duplicate values or check for an existing value before inserting.



## Methods
|      Methods            | Description                                                                             |
|-------------------------|-----------------------------------------------------------------------------------------|
| #insert(value)          | adds a new node to the appropriate position in the node tree                            |
| #find_max               | returns the address of the right most node in the bst                                   |
| #find_min               | returns the address of the left most node in the bst                                    |
| #delete(value)          | delete the value in the node tree and make adjustments to the child elemnts             |
| #contain?               | returns true of false depending on if the value given is in the node tree               |
| #size                   | returns the number(int) of items in the bst                                             |
| #find                   | returns the node address of the node with the given value                               |
| #in_order_travel        | returns the node keys in the inorder depth first search tree traversal                  |
| #pre_order_travel       | returns the node keys in the preorder depth first search tree traversal                 |
| #post_order_travel      | returns the node keys in the postorder depth first search tree traversal                |
| #level_order            | returns the node keys in the level order Breath first search tree traversal             |
| #height                 | returns the height of BST. it is the number of edges in longest path of the leaf node   |
| #depth                  | accepts a node and returns its depth.                                                   |
| #balanced?              | returns true or false depending on if the tree is balanced or not                       |
| #rebalance              | re-balances the binary sort treen                                                       |
