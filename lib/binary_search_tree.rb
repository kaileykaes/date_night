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
    
  end
end