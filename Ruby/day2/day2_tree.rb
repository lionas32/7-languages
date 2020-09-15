#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class Tree
  attr_accessor :children, :node_name
  
  #Changed to work with a hash being passed in
  def initialize(mytree, name: nil)
    @children = []

    if !name
      @node_name = mytree.keys[0]
    else
      @node_name = name
    end

    if mytree[node_name]
      mytree[node_name].keys.each do |key|
        children.push(Tree.new(mytree[node_name], name: key))
      end
    end
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({'grandpa' => 
  { 'dad' => 
    {'child 1' => {}, 'child 2' => {} }, 
  'uncle' => {'child 3' => {}, 'child 4' => {} } } })

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
