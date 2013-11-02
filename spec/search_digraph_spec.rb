require '../spec_helper.rb'
require 'digraph'

describe "Search Digraph" do
  describe "#route_distance" do
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
    it "returns 'not found' if route doesn't exist" do
      dg = Digraph.new
      dg.add_edge('A','B',5)
      dg.add_edge('B','C',7)
      expect(dg.route_distance('ACB')).to eq -1
    end
  end
  describe "#find_routes_by_stops" do
    it "finds all 1-stop routes" do
      dg = Digraph.new
      dg.add_edge('A','B',3)
      dg.add_edge('A','C',2)
      expect(dg.get_routes_from('A')).to eq [['AB', 3], ['AC', 2]]
    end
  end
end
