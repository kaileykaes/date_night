class ListNode
  attr_reader :score, :title
  attr_accessor :next_node
  
  def initialize(score, title)
    @score = score
    @title = title
    @next_node = nil
  end
end
