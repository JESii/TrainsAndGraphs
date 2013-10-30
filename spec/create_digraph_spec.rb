require '../spec_helper'
require 'digraph'

describe "Digraph" do
  it "creates a new Digraph" do
    dg = Digraph.new
    expect(dg).to be_a Digraph
    expect(dg.vcount).to eq 0
  end
  it "adds a vertex to the graphn" do
    dg = Digraph.new
    dn = dg.add_vertex('A')
    expect(dn).to be_a Dignode
    expect(dn.vname).to eq 'A'
    expect(dg.vcount).to eq 1
  end
  it "adds a new edge" do
    dg = Digraph.new
    dn = dg.add_vertex('A')
    expect(dg.add_edge('A','B',5)).to be_true
    expect(dg.get_distance('A','B')).to eq 5
  end
end
