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

    it 'sort two nodes' do 
      tree = BinarySearchTree.new
      tree.insert(61, "Bill & Ted's Excellent Adventure")
      tree.insert(16, "Johnny English")
      tree.sort
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

  it '#load' do 
    expect(@tree.load('movies.txt')).to eq(6)
    expect(@tree.includes?(10)).to be true
    expect(@tree.includes?(84)).to be true
    expect(@tree.includes?(22)).to be true
    expect(@tree.includes?(41)).to be true
  end

  it 'health' do 
    healthy_tree = Tree.new
    healthy_tree.insert(98, "Animals United")
    healthy_tree.insert(58, "Armageddon")
    healthy_tree.insert(36, "Bill & Ted's Bogus Journey")
    healthy_tree.insert(93, "Bill & Ted's Excellent Adventure")
    healthy_tree.insert(86, "Charlie's Angels")
    healthy_tree.insert(38, "Charlie's Country")
    healthy_tree.insert(69, "Collateral Damage")
    expect(healthy_tree.health(0)).to eq([[98, 7, 100]])
    expect(healthy_tree.health(1)).to eq([[58, 6, 85]])
    expect(healthy_tree.health(2)).to eq([[36, 2, 28], [93, 3, 42]])
  end
end