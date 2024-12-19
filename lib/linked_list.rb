class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(node)
    if @head == nil
      @head = node 
      @tail = node
    else
      new_node = node
      new_node.next_node = @head
      @head = new_node
      @head.next_node.prev_node = @head
    end
  end

  def append(node)
    if @head == nil
      @head = node
      @tail = node
    else
      previous = @tail
      @tail.next_node = node
      @tail = node
      @tail.prev_node = previous
    end
  end

  def insert(node, index) 
    current_node = @head #starting at the head either way
    if @head == nil 
      @head = node
      @tail = node
    elsif index == 0 #if inserting at 0, 
      prepend(node)
    else 
      (index - 1).times do # if index is more than zero, 
        current_node = current_node.next_node #traverse list until just before the insertion point
      end

      unless current_node.next_node == nil 
        trailing_node = current_node.next_node 
        current_node.next_node = node 
        node.next_node = trailing_node
        node.prev_node = current_node
      else
        append(node)
      end
    end
  end
  
  def delete(index)
    if @head.next_node == nil
      deleted_node = @head
      @head = nil
      @tail = nil
    elsif index == 0 
      deleted_node = @head
      @head = nil
      @head = deleted_node.next_node #this is weird  # test if this breaks when list is only 1 long
    elsif which_node(index) == @tail
      deleted_node = @tail
      saved_node = @tail.prev_node
      @tail = nil
      @tail = saved_node #also weird 
    else
      # prior_node = @head
      current_node = @head.next_node
      (index - 1).times do # if index is more than zero,
        # prior_node = prior_node.next_node #traverse list from behind deletion point
        current_node = current_node.next_node #traverse list until just before the insertion point
      end
      deleted_node = current_node
      
      unless current_node.next_node == nil 
        prior_node = current_node.prev_node
        trailing_node = current_node.next_node
        current_node = nil
        prior_node.next_node = trailing_node
        trailing_node.prev_node = prior_node
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
    if @head == nil
      @head = node
      @tail = node
    else
      current_node = @head
      if node.score < current_node.score
        prepend(node)
      else
        count = 1
        until node.score <= current_node.score || current_node.next_node == nil 
          current_node = current_node.next_node 
          count += 1
        end
        insert(node, count)
      end
    end
  end

  def digest
    digested = []
    current_node = @head
    until current_node.next_node == nil
      digested << current_node.compile
      current_node = current_node.next_node
    end
    digested << current_node.compile
    digested
  end
end