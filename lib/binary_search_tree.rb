class BinarySearchTree
  attr_reader :root
  
  def initialize(root = nil)
    @root = root
  end

  def insert(score, title)
    if @root == nil 
      @root = Node.new(score, title)
      return 0
    else
      insert_node(score, title)
    end
  end

  def insert_node(score, title)
    current = @root 
    new_value = Node.new(score, title)
    if new_value.score < current.score
      if current.left != nil
        require 'pry'; binding.pry
        insert_node(current.left, new_value)
      else
        current.left = new_value
        current.left.parent = current
      end
    else
      if current.right != nil
        insert_node(current.right, new_value)
      else
        current.right = new_value
        current.right.parent = current
      end
    end
  end

  def parent_count(node)
    current_node = node 
    count = 0 
    until current_node.parent == nil
      current_node = node.parent
      count += 1
    end
  end
end