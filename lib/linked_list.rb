class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def prepend(score, title)
    new_node = Node.new(score, title)
    new_node.next_node = @head
    @head = new_node
  end

  def append(score, title)
    current_node = @head
    until current_node.next_node == nil
      current_node = current_node.next_node
    end
    new_node = Node.new(score, title)
    current_node.next_node = new_node
  end

  def insert(score, title, index)
    count = 0
    if index == 0
      new_node = Node.new(score, title)
      new_node.next_node = @head
      @head = new_node
    else
      current_node = @head
      (index - 1).times do
        current_node = current_node.next_node
      end
      trailing_node = current_node.next_node
      new_node= Node.new(score, title)
      current_node.next_node = new_node
      new_node.next_node = trailing_node
    end
  end

  def delete(index)
    current_node = @head
    (index - 1).times do
      current_node = current_node.next_node
    end
    tbd = current_node.next_node
    trailing_node = tbd.next_node
    current_node.next_node = trailing_node
    tbd.next_node = nil
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
    index + 1.times do 
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
end