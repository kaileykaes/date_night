class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(node)
    new_node = node
    new_node.next_node = @head
    @head = new_node
  end

  def append(node)
    if @head == nil
      @head = node
      @tail = node
    else
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = node #memoization might help?
    end
  end

  def insert(node, index) #perhaps memoization could help here 
    current_node = @head #starting at the head either way
    if index == 0 #if inserting at 0, 
      @head = node #node is new head
      node.next_node = current_node #old head is now in position 1
    else 
      (index - 1).times do # if index is more than zero, 
        current_node = current_node.next_node #traverse list until just before the insertion point
      end

      unless current_node.next_node == nil 
        trailing_node = current_node.next_node 
        current_node.next_node = node 
        node.next_node = trailing_node
      else
        current_node.next_node = node
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
    if @head == nil
      @head = node
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