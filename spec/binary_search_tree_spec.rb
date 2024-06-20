require 'spec_helper'

RSpec.describe BinarySearchTree do 
  describe 'initialize' do 
    it 'exists and has attributes' do 
      tree = BinarySearchTree.new
      expect(@root).to eq(nil)
    end
  end

  describe 'methods' do 
    it "insert" do
      tree = BinarySearchTree.new
      expect(tree.insert(61, "Bill & Ted's Excellent Adventure")).to eq(0)
      expect(tree.insert(16, "Johnny English")).to eq(1)
      expect(tree.insert(92, "Sharknado 3")).to eq(1)
      expect(tree.insert(50, "Hannibal Buress: Animal Furnace")).to eq(2)

    end

    it "includes?" do
      tree = BinarySearchTree.new
      tree.insert(61, "Bill & Ted's Excellent Adventure")
      tree.insert(16, "Johnny English")
      tree.insert(92, "Sharknado 3")
      expect(tree.includes?(16)).to eq(true)
      expect(tree.includes?(17)).to eq(false)
    end
  end
end