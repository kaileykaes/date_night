require 'spec_helper'

RSpec.describe BinarySearchTree do 
  before :each do 
    @tree = BinarySearchTree.new
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
  end
  
  describe 'initialize' do 
    it 'exists and has attributes' do 
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

    it 'parent_count' do 
      node = @tree.root.left.right

      expect(@tree.parent_count(node)).to eq(2)
    end

    it "includes?" do
      expect(@tree.includes?(16)).to be true
      expect(@tree.includes?(17)).to be false
      expect(@tree.includes?(92)).to be true
    end

    it "depth_of" do
      expect(@tree.depth_of(61)).to eq(0)
      expect(@tree.depth_of(16)).to eq(1)
      expect(@tree.depth_of(92)).to eq(1)
      expect(@tree.depth_of(50)).to eq(2)
    end

    it "max" do
      expect(@tree.max).to eq({"Sharknado 3"=>92})
    end

    it "min" do
      expect(@tree.min).to eq({"Johnny English"=>16})
    end

    it "sort" do
      @tree.insert(26, "Titanic")
      @tree.insert(17, "Up")
      expect(@tree.sort).to eq(
        [
          {"Johnny English"=>16},
          {"Up"=>17},
          {"Titanic"=>26},
          {"Hannibal Buress: Animal Furnace"=>50},
          {"Bill & Ted's Excellent Adventure"=>61},
          {"Sharknado 3"=>92}
        ]
      )
    end
  end
end