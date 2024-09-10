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
      insert_node(score, title, @root)
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
      includes?(value, current.right)
    else 
      false
    end
  end
  
  def depth_of(value, current = nil, counter = 0)
    
    if current == nil
      current = @root
    end
    
    if value == current.score
      counter
    elsif value < current.score && current.left != nil
      counter += 1
      depth_of(value, current.left, counter)
    elsif value > current.score && current.right != nil
      counter += 1
      depth_of(value, current.right, counter)
    else 
      nil
    end
    #new variable is called counter. counter works by increasing by one every recurssion
  end
  
  def max
    current = @root
    until current.right == nil
      current = current.right
    end
    current.compile
  end
  
  def min
    found_node = self.minimize
    found_node.compile
  end
  
  def sort
    sorting_list = LinkedList.new
    traversal_list = LinkedList.new
    traversal_list.append(@root)
    while traversal_list.count > 0
      node = traversal_list.delete(0)
      sorting_list.insert_by_score(node)
      # unless node == nil 
      #lets try memoization here ||= 
      if node.right != nil
        # node.right.next_node = nil
        traversal_list.append(node.right) 
        sorting_list.insert_by_score(node.right)
      end
      if node.left != nil 
        # node.left.next_node = nil 
        traversal_list.append(node.left)  
        sorting_list.insert_by_score(node.left)
      end
    end
    sorting_list.digest
  end

  def load(filepath)
    count = 0
    file_contents = File.open("data/#{filepath}").readlines
    file_contents.each do |content|
      stuff = content.split(',')
      title = stuff.last.lstrip.chop
      score = stuff.first.to_i
      insert(score, title)
      count += 1
    end
    count
  end

  def health(level)
    #travel down tree to level for every node at level
    #create an array of each node on that level 
    #level of node
    #score of node

    #all children of particular node
    
    #number of all nodes in tree
    require 'pry'; binding.pry
  end

  # def sort
  #   if @root == nil 
  #     return 'no root'
  #   end
  #   queue = LinkedList.new
  #   sorted = LinkedList.new

  #   queue.append(@root)

  #   while queue.count > 0

  #     current_node = queue.head

  #     queue.append(current_node.left)
  #     queue.append(current_node.right)

  #     sorted.insert_by_score(current_node)

  #     queue.delete(0)
  #     require 'pry'; binding.pry
  #   end
  # end
  
  
  private
  def minimize
    current = @root
    until current.left == nil
      current = current.left
    end
    current
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
    elsif score > current_node.score && current_node.right != nil
      insert_node(score, title, current_node.right)
    else
      return "error: node unprocessable"
    end
  end
end