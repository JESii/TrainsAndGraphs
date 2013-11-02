require '../spec_helper'
require 'dignode'

describe "Dignode" do
  it "creates a new Dignode" do
    dn = Dignode.new('A')
    expect(dn.name).to eq 'A'
  end
  it "adds an adjacent vertex" do
    dn = Dignode.new('A','B',4)
    expect(dn.distance('B')).to eq 4
  end
  it "adds an edge to existing node" do
    dn = Dignode.new('A')
    dn.add_adj_vertex('B',14)
    expect(dn.distance('B')).to eq 14
  end
  # TODO: Find a clean way to test this condition
  xit "doesn't add a nil adjancency [bug]" do
    dn = Dignode.new('A','B',13)
    expect{ dn.distance('') }.to raise_error(KeyError)
  end
  it "finds the edge distance for specified edge" do
    dn = Dignode.new('a','b',12)
    dn.add_adj_vertex('c',15)
    dn.add_adj_vertex('d',9)
    expect(dn.distance('d')).to eq 9
  end
end
