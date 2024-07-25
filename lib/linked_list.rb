class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def prepend(node)
    new_node = create_node(node)
    new_node.next_node = @head
    @head = new_node
  end

  def append(node)
    new_node = create_node(node)
    if @head == nil
      @head = new_node
    else
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = new_node
    end
  end

  def insert(node, index)
    new_node = create_node(node)
    current_node = @head #starting at the head either way
    if index == 0 #if inserting at 0, 
      @head = new_node #new_node is new head
      new_node.next_node = current_node #old head is now in position 1
    else 
      (index - 1).times do # if index is more than zero, 
        current_node = current_node.next_node #traverse list until just before the insertion point
      end
      
      unless current_node.next_node == nil 
        trailing_node = current_node.next_node 
        current_node.next_node = new_node 
        new_node.next_node = trailing_node
      else
        current_node.next_node = new_node
      end
    end
  end
  
  def delete(index)
    if index == 0 
      deleted_node = @head
      @head = nil
      @head = deleted_node.next_node # test if this breaks when list is only 1 long
    else
      prior_node = @head
      current_node = @head.next_node
      future_node = current_node.next_node
      (index - 1).times do # if index is more than zero,
        prior_node = prior_node.next_node #traverse list from behind deletion point
        current_node = current_node.next_node #traverse list until just before the insertion point
      end
      
      deleted_node = current_node
      
      unless current_node.next_node == nil 
        trailing_node = current_node.next_node
        current_node = nil
        prior_node.next_node = trailing_node
      else
        current_node = nil
      end
    end
    deleted_node
  end
  
  def count
    if @head == nil 
      0 
    else
      current_node = @head 
      counter = 1
      until current_node.next_node == nil 
        current_node = current_node.next_node 
        counter += 1
      end
      counter
    end
  end
  
  def which_node(index)
    current_node = @head
    index.times do 
      current_node = current_node.next_node
    end
    current_node
  end
  
  def string_maker
    string = []
    current_node = @head
    until current_node == nil
      string << current_node.title
      current_node = current_node.next_node
    end
    string.join(" ")
  end
  
  def insert_by_score(node)
    new_node = create_node(node)
    if @head == nil
      @head = new_node
    else
      current_node = @head
      if new_node.score < current_node.score
        prepend(new_node)
      else
        count = 1
        until new_node.score <= current_node.score || current_node.next_node == nil 
          current_node = current_node.next_node 
          count += 1
        end
        insert(new_node, count)
      end
    end
  end

  private
  def create_node(node)
    ListNode.new(node.score, node.title)
  end
end