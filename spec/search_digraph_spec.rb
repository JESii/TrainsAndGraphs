require '../spec_helper.rb'
require 'digraph'

describe "Search Digraph" do
  it "returns a one-edge distance" do
    dg = Digraph.new
    dg.add_edge('A','B',5)
    expect(dg.distance('A','B')).to eq 5
  end
end
