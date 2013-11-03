require '../spec_helper.rb'
require 'digraph'

describe "Search Digraph" do
  describe "String" do
    it "provides access to last character of string" do
      expect('abc'.last).to eq 'c'
      expect('a'.last).to eq 'a'
      expect(''.last).to eq ''
    end
  end
  describe "create simple graphs" do
    it "creates a 3-edge graph" do
      dg = Digraph.new()
      dg.add_edge('a','b',3)
      dg.add_edge('a','c',2)
      dg.add_edge('b','c',4)
      expect(dg.route_distance('abc')).to eq 7
    end
  end
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
      expect(dg.get_route_list('A')).to eq [['AB', 3], ['AC', 2]]
    end
    it "finds 2-stop routes" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      dg.add_edge('a','c',2)
      dg.add_edge('b','c',4)
      expect(dg.get_routes_from('a',2)).to eq [['ab', 3],['ac', 2],['abc', 7]]
    end
    xit "finds 3-stop routes" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      dg.add_edge('a','c',2)
      dg.add_edge('b','c',4)
      dg.add_edge('b','d',1)
      expect(dg.get_routes_from('a',2)).to eq [['ab', 3],['ac', 2],['abc', 7],['abcd',8]]
    end
  end
end
