require 'spec_helper'

RSpec.describe Node do
  before(:each) do
    @node = Node.new(95, 'When Harry Met Sally')
  end

  describe 'initialize' do 
    it 'exists and has attributes' do 
      expect(@node).to be_a Node

      expect(@node.score).to eq(95)
      expect(@node.title).to eq('When Harry Met Sally')
      expect(@node.left).to eq(nil)
      expect(@node.right).to eq(nil)
      expect(@node.parent).to eq(nil)
      expect(@node.next_node).to eq(nil)
      expect(@node.tag).to eq(false)
    end
  end

  describe 'methods' do 
    it '#compile' do 
      expect(@node.compile).to eq({
        'When Harry Met Sally' => 95
      })
    end
  end
end