class BinarySearchTree
  attr_reader :current_value
  
  def initialize(root = nil)
    @root = root
  end

  def insert(score, title)
    if @root == nil 
      @root = Node.new(score, title)
      return 0 
    else
      insert_node(score, title, @root)
    end
  end

  def insert_node(score, title, node)
    #current_node is the dynamic node that will change
    current_node = node
    if score < current_node.score && current_node.left == nil
      new_node = Node.new(score, title)
      current_node.left = new_node
      new_node.parent = current_node
      parent_count(new_node)
    elsif score > current_node.score && current_node.right == nil
      new_node = Node.new(score, title)
      current_node.right = new_node
      new_node.parent = current_node
      parent_count(new_node)
    elsif score < current_node.score && current_node.left != nil
      insert_node(score, title, current_node.left)
    elsif score < current_node.score && current_node.right != nil
      insert_node(score, title, current_node.right)
    else
      return "error: node unprocessable"
    end
  end

  def parent_count(node)
    count = 0
    counter_node = node
    until counter_node.parent == nil
      count += 1
      counter_node = counter_node.parent
    end
    return count
  end

  def includes?(value, current = nil)
    if current == nil
      current = @root
    end
    if value == current.score
      return true
    elsif value < current.score && current.left != nil
      includes?(value, current.left)
    elsif value > current.score && current.right != nil
      includes?(value, current.rigt)
    else 
      false
    end
  end
end