require "./lib/binary_search_tree"
require "./lib/node"
require 'spec_helper'
require 'simplecov'

RSpec.describe BinarySearchTree do 
  
  describe "insert" do
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    expect(tree).to eq(1)

  end
end