require 'spec_helper'

RSpec.describe LinkedList do
  describe "prepend" do
    it "adds a node to the beginning of the list" do
      list = LinkedList.new
      node_1 = ListNode.new(1, "brown")
      node_2 = ListNode.new(1, "green")
      list.prepend(node_1)
      list.prepend(node_2)
      expect(list.string_maker).to eq("green brown")
    end
  end

  describe "append" do
    it "adds a node to the end of the list" do
      list = LinkedList.new
      node_1 = ListNode.new(1, "brown")
      node_2 = ListNode.new(1, "green")
      node_3 = ListNode.new(90, "blue")
      list.prepend(node_1)
      list.prepend(node_2)
      list.append(node_3)
      expect(list.string_maker).to eq("green brown blue")
    end
  end

  describe "insert" do
    it "adds a node to a specfic point of the list" do
      list = LinkedList.new
      node_1 = ListNode.new(34, "brown")
      node_2 = ListNode.new(25, "green")
      node_0 = ListNode.new(67, "blue")
      list.append(node_1)
      list.append(node_2)
      list.insert(node_0, 0)

      expect(list.which_node(0).score).to eq(67)
      expect(list.which_node(0).title).to eq("blue")
      expect(list.which_node(0)).to be_a ListNode 
      expect(list.count).to eq(3)
    end
  end

  describe "insert by score" do
    it "inserts nodes in ascending order by score" do
      list = LinkedList.new
      node_1 = ListNode.new(34, "brown")
      node_2 = ListNode.new(25, "green")
      node_3 = ListNode.new(67, "blue")
      list.insert_by_score(node_1)
      list.insert_by_score(node_2)
      list.insert_by_score(node_3)

      list_node_1 = list.head
      list_node_2 = list.head.next_node
      list_node_3 = list.head.next_node.next_node

      expect(list.count).to eq(3)
      expect(list_node_1.score).to eq(25)
      expect(list_node_2.score).to eq(34)
      expect(list_node_3.score).to eq(67)
    end
  end

  describe "delete" do
    it "deletes a node to a specfic point of the list" do
      list = LinkedList.new
      node_1 = ListNode.new(35, "brown")
      node_2 = ListNode.new(12, "green")
      node_3 = ListNode.new(7, "blue")
      list.append(node_1)
      list.append(node_3)
      list.insert(node_2, 1)

      node = list.delete(1)
      
      expect(node).to be_a ListNode
      expect(node.score).to eq(12)
      expect(node.title).to eq("green")
    end
    
    it "deletes specific node > 1" do
      list = LinkedList.new
      node_0 = ListNode.new(4, "purple")
      node_1 = ListNode.new(35, "brown")
      node_2 = ListNode.new(12, "green")
      node_3 = ListNode.new(7, "blue")
      list.append(node_0)
      list.append(node_1)
      list.append(node_2)
      list.append(node_3)
      
      node = list.delete(2)

      expect(node).to be_a ListNode
      expect(node.score).to eq(12)
      expect(node.title).to eq("green")
    end

    it "can delete the first node" do
      list = LinkedList.new
      node_1 = ListNode.new(35, "brown")
      node_2 = ListNode.new(12, "green")
      node_3 = ListNode.new(7, "blue")
      list.append(node_1)
      list.append(node_2)
      list.append(node_3)

      node = list.delete(0)

      expect(node).to be_a ListNode
      expect(node.score).to eq(35)
      expect(node.title).to eq("brown")
    end

    it "can delete node if list is only 1 node long" do
      list = LinkedList.new
      node_1 = ListNode.new(35, "brown")
    
      list.append(node_1)
      
      node = list.delete(0)

      expect(node).to be_a ListNode
      expect(node.score).to eq(35)
      expect(node.title).to eq("brown")
    end
  end

  describe "count" do 
    it "counts nodes in list" do 
      list = LinkedList.new
      node_1 = ListNode.new(35, "brown")
      node_2 = ListNode.new(12, "green")
      node_3 = ListNode.new(7, "blue")
      list.prepend(node_1)
      list.prepend(node_2)
      list.insert(node_3, 1)

      expect(list.count).to eq(3)
    end

    it "counts empty list" do 
      list = LinkedList.new

      expect(list.count).to eq(0)
    end
  end

  describe "which_node" do 
    it "returns node at specified index" do 
      list = LinkedList.new
      node_1 = ListNode.new(34, "brown")
      node_2 = ListNode.new(67, "green")
      node_3 = ListNode.new(90, "blue")
      list.append(node_1)
      list.append(node_2)
      list.append(node_3)
      node = list.which_node(1)

      expect(node).to be_a ListNode
      expect(node.score).to eq(67)      
      expect(node.title).to eq("green")      
    end
  end
end