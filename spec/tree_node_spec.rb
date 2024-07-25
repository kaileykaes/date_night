require 'spec_helper'

RSpec.describe TreeNode do
  before(:each) do
    @node = TreeNode.new(92, 'Aladdin')
  end

  describe 'initialize' do 
    it 'exists' do 
      expect(@node).to be_a TreeNode
    end

    it 'has attributes' do 
      expect(@node.score).to eq(92)
      expect(@node.title).to eq('Aladdin')
      expect(@node.left).to eq(nil)
      expect(@node.right).to eq(nil)
      expect(@node.parent).to eq(nil)
    end
  end
end