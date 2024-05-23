class Node
  attr_reader :score, :title 
  attr_accessor :left, :right, :parent

  def initialize(score, title)
    @score = score
    @title = title
    @left = left
    @right = right
    @parent = parent
  end
end