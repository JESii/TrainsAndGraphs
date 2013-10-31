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
end
