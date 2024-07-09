require "./lib/linked_list"
require "./lib/node"

RSpec.describe LinkedList do
  describe "prepend" do
    it "adds a node to the beginning of the list" do
      list = LinkedList.new
      list.prepend(1, "brown")
      list.prepend(34, "green")
      expect(list.string_maker).to eq("green brown")
    end
  end

  describe "append" do
    it "adds a node to the end of the list" do
      list = LinkedList.new
      list.prepend(45, "brown")
      list.prepend(67, "green")
      list.append(90, "blue")
      expect(list.string_maker).to eq("green brown blue")
    end
  end

  describe "insert" do
    it "adds a node to a specfic point of the list" do
      list = LinkedList.new
      list.append(34, "brown")
      list.append(25, "green")
      list.insert(67, "blue", 1)

      expect(list.pop(1).score).to eq(67)
      expect(list.pop(1).title).to eq("blue")
      expect(list.pop(1)).to be_a Node
    end
  end

  describe "delete" do
    it "deletes a node to a specfic point of the list" do
      list = LinkedList.new
      list.prepend(35, "brown")
      list.prepend(12, "green")
      list.insert(7, "blue", 1)
      # require 'pry'; binding.pry
      node = list.delete(1)

      expect(node).to be_a Node
      expect(node.score).to eq(7)
      expect(node.title).to eq("blue")
      expect(list.string_maker).to eq("green brown")
    end
  end

  describe "count" do 
    it "counts nodes in list" do 
      list = LinkedList.new
      list.prepend(35, "brown")
      list.prepend(12, "green")
      list.insert(7, "blue", 1)
      expect(list.count).to eq(3)
    end
  end

  describe "pop" do 
    it "returns node at specified index" do 
      list = LinkedList.new
      list.append(45, "brown")
      list.append(67, "green")
      list.append(90, "blue")
      node = list.pop(1)

      expect(node).to be_a Node
      expect(node.score).to eq(67)      
      expect(node.title).to eq("green")      
    end
  end
end