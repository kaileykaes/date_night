require 'spec_helper'

RSpec.describe BinarySearchTree do 
  describe 'initialize' do 
    xit 'exists and has attributes' do 
      tree = BinarySearchTree.new
      
    end
  end

  describe 'methods' do 
    it "insert" do
      tree = BinarySearchTree.new
      expect(tree.insert(61, "Bill & Ted's Excellent Adventure")).to eq(0)
    end
  end
end