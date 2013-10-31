require '../spec_helper'
require 'digraph'

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
end
