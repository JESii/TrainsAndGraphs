require '../spec_helper'
require 'digraph'

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
describe "Digraph" do
  context "Basic vertex/edge creation" do
    it "creates a new Digraph" do
      dg = Digraph.new
      expect(dg).to be_a Digraph
      expect(dg.vcount).to eq 0
    end
    it "adds a vertex to the graphn" do
      dg = Digraph.new
      dn = dg.add_vertex('A')
      expect(dn).to be_a Dignode
      expect(dn.name).to eq 'A'
      expect(dg.vcount).to eq 1
      expect(dg.ecount).to eq 0
    end
    it "adds a new edge" do
      dg = Digraph.new
      dn = dg.add_vertex('A')
      expect(dg.add_edge('A','B',5)).to be_true
      expect(dg.vcount).to eq 2
      expect(dg.ecount).to eq 1
    end
    it "adds two edges" do
      dg = Digraph.new
      dn1 = dg.add_vertex 'A'
      expect(dg.add_edge('A','B',3)).to eq true
      expect(dg.add_edge('A','C',4)).to eq true
      expect(dg.vcount).to eq 3
      expect(dg.ecount).to eq 2
      expect(dg[1].name).to eq 'A'
      expect(dg[2].name).to eq 'B'
      expect(dg.add_edge('A','D',7)).to eq true
      expect(dg.vcount).to eq 4
      expect(dg.ecount).to eq 3
    end
  end
  describe "Access to distance data between two nodes" do
     xit "returns distance between two immediately adjacent nodes" do
        dg = Digraph.new
        dg.add_edge('A','B',5)
        dna = dg.find_vertex('A')
        expect(dna.distance('B')).to eq 5
        expect(dg.distance('A','B')).to eq 5
     end
     xit "returns correct distance for 2nd edge" do
       dg = Digraph.new
       dg.add_edge('A','B',5)
       dg.add_edge('B','C',7)
       expect(dg.distance('B','C')).to eq 7
     end
  end
end
