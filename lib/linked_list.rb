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
    present_node = @head #starting at the head either way
    if index == 0 #if inserting at 0, 
      @head = node #node is new head
      node.next_node = present_node #old head is now in position 1
    else 
      (index - 1).times do # if index is more than zero, 
        present_node = present_node.next_node #traverse list until just before the insertion point
      end

      unless present_node.next_node == nil 
        trailing_node = present_node.next_node 
        present_node.next_node = node 
        node.next_node = trailing_node
      else
        present_node.next_node = node
      end
    end
  end

  # def delete(index)
  #   current_node = @head #starts traversal of list at head
  #   if index == 0 # if deleting head, 
  #     @head = current_node.next_node #next node is now head
  #     return current_node
  #   end

  #   (index - 1).times do #until right before the node in question, 
  #     current_node = current_node.next_node #traverse the list
  #   end
  #   deleted_node = pop(index) #save the node to be deleted to return later
  #   if current_node.next_node == nil # if the next node in the list is actually nothing, 
  #     tbd = nil #then the deleted node is nothing
  #     trailing_node = nil #and the trailing node after deletion is nothing
  #   else #if the node to delete and the node after the deleted node exist,
  #     tbd = current_node.next_node #the node to delete gets saved to a variable
  #     trailing_node = tbd.next_node #the node after the node to delete gets saved to a trailing node variable THIS SEEMS SUPER FISHY HERE
  #   end
  #   current_node.next_node = trailing_node #the node to delete is now the trailing node
  #   tbd.next_node = nil #the node after the node to delete is actually nothing
  #   deleted_node #let's return the node that was ostensibly deleted
  # end


  def delete(index)
    prior_node = @head
    present_node = @head.next_node
    future_node = present_node.next_node
    (index - 1).times do 
      prior_node = prior_node.next_node
      present_node = present_node.next_node
      future_node = future_node.next_node
    end
    deleted_node = present_node
    prior_node.next_node = future_node
    present_node = nil
    deleted_node
  end

  def count 
    if @head == nil
      return 0
    end
    # break
    current_node = @head 
    count = 1
    # require 'pry'; binding.pry
    until current_node.next_node == nil
      # require 'pry'; binding.pry
      current_node = current_node.next_node
      # require 'pry'; binding.pry
      count += 1
      break if current_node.next_node == nil
      # require 'pry'; binding.pry
    end
    count
  end


  # def count 
  #   counter = 1
  #   if @head == nil 
  #     0 
  #   else
  #     present_node = @head 
  #     until present_node.next_node == nil
  #       present_node = present_node.next_node 
  #       counter += 1
  #     end
  #   end
  #   counter
  # end

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
end