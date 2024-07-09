require "./lib/linked_list"
require "./lib/node"

RSpec.describe LinkedList do
  describe "prepend" do
    it "adds a node to the beginning of the list" do
      list = LinkedList.new
      list.prepend("brown")
      list.prepend("green")
      expect(list.string_maker).to eq("green brown")
    end
  end

  describe "append" do
    it "adds a node to the end of the list" do
      list = LinkedList.new
      list.prepend("brown")
      list.prepend("green")
      list.append("blue")
      expect(list.string_maker).to eq("green brown blue")
    end
  end

  describe "insert" do
    it "adds a node to a specfic point of the list" do
      list = LinkedList.new
      list.prepend("brown")
      list.prepend("green")
      list.insert("blue", 1)
      expect(list.string_maker).to eq("green blue brown")
    end
  end
  
  describe "delete" do
    it "deletes a node to a specfic point of the list" do
      list = LinkedList.new
      list.prepend("brown")
      list.prepend("green")
      list.insert("blue", 1)
      list.delete(1)
      expect(list.string_maker).to eq("green brown")
    end
  end
end