require '../spec_helper.rb'
require 'digraph'

describe "Search Digraph" do
  it "returns a one-edge distance" do
    dg = Digraph.new
    dg.add_edge('A','B',5)
    expect(dg.route_distance('AB')).to eq 5
  end
  it "returns a two-edge distance" do
    dg = Digraph.new
    dg.add_edge('A','B',5)
    dg.add_edge('B','C',7)
    expect(dg.route_distance('ABC')).to eq 12
  end
end
