require "./lib/linked_list"
require "./lib/node"

RSpec.describe LinkedList do
  before :each do 
    @list = LinkedList.new
    @node_0 = Node.new(67, "blue")
    @node_1 = Node.new(34, "brown")
    @node_2 = Node.new(25, "green")
    @node_3 = Node.new(90, "blue")
  end

  describe "methods" do
    xit "#prepend" do
      @list = LinkedList.new
      @list.prepend(@node_1)
      @list.prepend(@node_2)
      expect(@list.head).to eq(@node_2)
      expect(@list.tail).to eq(@node_1)
    end

    xit "#append" do
      @list.prepend(@node_1)
      @list.prepend(@node_2)
      @list.append(@node_3)
      
      head = @list.head
      second_node = @list.head.next_node
      third_node = @list.head.next_node.next_node
      tail = @list.tail
      expect(head).to eq(@node_2)
      expect(second_node).to eq(@node_1)
      expect(third_node).to eq(@node_3)
      expect(tail).to eq(@node_3)
    end
    
    xit '#append if only 1' do 
      @list.append(@node_3)
      head = @list.head
      tail = @list.tail
      
      expect(head).to eq(tail)
      expect(@list.count).to eq(1)
    end

    xit "insert" do
      @list.append(@node_1)
      @list.append(@node_2)
      @list.insert(@node_0, 0)

      expect(@list.which_node(0).score).to eq(67)
      expect(@list.which_node(0).title).to eq("blue")
      expect(@list.which_node(0)).to be_a Node 
      expect(@list.count).to eq(3)
      expect(@list.tail).to eq(@node_2)
    end

    xit "#insert_by_score" do
      @list.insert_by_score(@node_1)
      @list.insert_by_score(@node_2)
      @list.insert_by_score(@node_3)

      expect(@list.count).to eq(3)
      expect(@list.head).to eq(@node_2)
      expect(@list.head.next_node).to eq(@node_1)
      expect(@list.head.next_node.next_node).to eq(@node_3)
      expect(@list.tail).to eq(@node_3)
    end

    xit "#delete" do
      @list.append(@node_0)
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)
      
      node = @list.delete(2)

      expect(node).to be_a Node
      expect(node.score).to eq(25)
      expect(node.title).to eq("green")
    end

    xit "#delete if head" do
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)

      node = @list.delete(0)

      expect(node).to be_a Node
      expect(node.score).to eq(34)
      expect(node.title).to eq("brown")
    end

    xit "#delete if tail" do
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)

      node = @list.delete(2)
      tail = @list.tail

      expect(node).to be_a Node
      expect(node.score).to eq(90)
      expect(node.title).to eq("blue")

      expect(tail).to eq(@list.tail)
      expect(tail).to eq(@node_2)
    end

    xit "#delete if single node" do
      @list.append(@node_1)
      
      node = @list.delete(0)

      expect(node).to be_a Node
      expect(node.score).to eq(34)
      expect(node.title).to eq("brown")
    end

    it "#count" do 
      @list.append(@node_1)
      @list.append(@node_2)
      @list.insert(@node_3, 1)
      expect(@list.count).to eq(3)
    end

    xit "#count if node empty" do 
      @list = LinkedList.new

      expect(@list.count).to eq(0)
    end

    xit "#which_node" do 
      @list.append(@node_1)
      @list.append(@node_2)
      @list.append(@node_3)
      node = @list.which_node(1)

      expect(node).to be_a Node
      expect(node.score).to eq(25)      
      expect(node.title).to eq("green")      
    end

    xit 'digest' do 
      list = LinkedList.new
      node_1 = Node.new(0, 'Happy Feet')
      node_2 = Node.new(96, 'Freedom Writers')
      node_3 = Node.new(98, 'The Music Man')
      list.append(node_1)
      list.append(node_2)
      list.append(node_3)

      expected = list.digest

      expect(expected).to eq([
        {'Happy Feet' => 0}, 
        {'Freedom Writers' => 96}, 
        {'The Music Man' => 98}
      ])
    end
  end
end