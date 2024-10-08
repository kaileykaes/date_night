class Node
  attr_reader :score, :title 
  attr_accessor :left, :right, :parent, :next_node, :prev_node, :tag  #next_node can be written to and stored as an attribute

  def initialize(score, title)
    @score = score
    @title = title
    @left = left
    @right = right
    @parent = parent
    @next_node = next_node
    @prev_node = prev_node
    @tag = false

  end

  def compile
    {@title => @score}
  end
end