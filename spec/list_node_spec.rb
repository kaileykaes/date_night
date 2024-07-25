require 'spec_helper'

RSpec.describe ListNode do
  before(:each) do
    @node = ListNode.new(92, 'Aladdin')
  end

  describe 'initialize' do 
    it 'exists' do 
      expect(@node).to be_a ListNode
    end

    it 'has attributes' do 
      expect(@node.score).to eq(92)
      expect(@node.title).to eq('Aladdin')
      expect(@node.next_node).to be nil
    end
  end
end