require "./lib/linked_list"
require "./lib/node"

RSpec.describe LinkedList do
  describe "prepend" do
    it "adds a node to the beginning of the list" do
      list = LinkedList.new
      node_1 = Node.new(1, "brown")
      node_2 = Node.new(1, "green")
      list.prepend(node_1)
      list.prepend(node_2)
      expect(list.string_maker).to eq("green brown")
    end
  end

  describe "append" do
    it "adds a node to the end of the list" do
      list = LinkedList.new
      node_1 = Node.new(1, "brown")
      node_2 = Node.new(1, "green")
      node_3 = Node.new(90, "blue")
      list.prepend(node_1)
      list.prepend(node_2)
      list.append(node_3)
      expect(list.string_maker).to eq("green brown blue")
    end
  end

  describe "insert" do
    it "adds a node to a specfic point of the list" do
      list = LinkedList.new
      node_1 = Node.new(34, "brown")
      node_2 = Node.new(25, "green")
      node_3 = Node.new(67, "blue")
      list.append(node_1)
      list.append(node_2)
      list.insert(node_3, 0)

      expect(list.pop(0).score).to eq(67)
      expect(list.pop(0).title).to eq("blue")
      expect(list.pop(0)).to be_a Node
    end
  end

  describe "insert by score" do
    it "inserts nodes in ascending order by score" do
      list = LinkedList.new
      node_1 = Node.new(34, "brown")
      node_2 = Node.new(25, "green")
      node_3 = Node.new(67, "blue")
      list.insert_by_score(node_1)
      list.insert_by_score(node_2)
      list.insert_by_score(node_3)

      expect(list.count).to eq(3)
      expect(list.head).to eq(node_2)
      expect(list.head.next_node).to eq(node_1)
      expect(list.head.next_node.next_node).to eq(node_3)
    end
  end

  describe "delete" do
    it "deletes a node to a specfic point of the list" do
      list = LinkedList.new
      node_1 = Node.new(35, "brown")
      node_2 = Node.new(12, "green")
      node_3 = Node.new(7, "blue")
      list.prepend(node_1)
      list.prepend(node_2)
      list.insert(node_3, 1)

      node = list.delete(1)

      expect(node).to be_a Node
      expect(node.score).to eq(7)
      expect(node.title).to eq("blue")
      expect(list.string_maker).to eq("green brown")
    end

    it "can delete the first node" do
      list = LinkedList.new
      node_1 = Node.new(35, "brown")
      node_2 = Node.new(12, "green")
      node_3 = Node.new(7, "blue")
      list.append(node_1)
      list.append(node_2)
      list.append(node_3)

      node = list.delete(0)

      expect(node).to be_a Node
      expect(node.score).to eq(35)
      expect(node.title).to eq("brown")
      expect(list.string_maker).to eq("green blue")
    end
  end

  describe "count" do 
    it "counts nodes in list" do 
      list = LinkedList.new
      node_1 = Node.new(35, "brown")
      node_2 = Node.new(12, "green")
      node_3 = Node.new(7, "blue")
      list.prepend(node_1)
      list.prepend(node_2)
      list.insert(node_3, 1)

      expect(list.count).to eq(3)
    end
  end

  describe "pop" do 
    it "returns node at specified index" do 
      list = LinkedList.new
      node_1 = Node.new(34, "brown")
      node_2 = Node.new(67, "green")
      node_3 = Node.new(90, "blue")
      list.append(node_1)
      list.append(node_2)
      list.append(node_3)
      node = list.pop(1)

      expect(node).to be_a Node
      expect(node.score).to eq(67)      
      expect(node.title).to eq("green")      
    end
  end
end