class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def prepend(node)
    new_node = node
    new_node.next_node = @head
    @head = new_node
  end

  def append(node)
    if @head == nil
      @head = node
    else
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = node
    end
  end

  def insert(node, index)
    count = 0
    if index == 0
      @head = node
    else
      current_node = @head
      (index - 1).times do
        current_node = current_node.next_node
      end
      if current_node.next_node == nil
        trailing_node = nil
      else
        trailing_node = current_node.next_node
      end

      current_node.next_node = node
      node.next_node = trailing_node
    end
  end

  def delete(index)
    current_node = @head

    if index == 0
      @head = current_node.next_node
      require 'pry'; binding.pry
      return current_node
    end

    (index - 1).times do
      current_node = current_node.next_node
    end
    deleted_node = pop(index)
    if current_node.next_node == nil
      tbd = nil
      trailing_node = nil
    else
      tbd = current_node.next_node
      trailing_node = tbd.next_node
    end
    current_node.next_node = trailing_node
    tbd.next_node = nil
    deleted_node
  end

  def count
    current_node = @head
    count = 1
    until current_node.next_node == nil
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  def pop(index)
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
end