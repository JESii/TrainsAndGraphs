require '../spec_helper'
require 'digraph'

describe 'Digraph input' do
  it "reads a line of input and creates a node and edge" do
    dg = Digraph.new
    dg.read_graph('test1.dat')
    expect(dg.vcount).to eq 2
    expect(dg.distance('A','B')).to eq 5
  end
  it "creates a 4-node digraph" do
    dg = Digraph.new
    dg.read_graph('test2.dat')
    expect(dg.vcount).to eq 4
    expect(dg.distance('A','B')).to eq 5
    expect(dg.distance('C','D')).to eq 4
  end
end
