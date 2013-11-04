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
      expect(dg.path_distance('abc')).to eq 7
    end
  end
  describe "#path_distance" do
    it "returns a one-edge distance" do
      dg = Digraph.new
      dg.add_edge('A','B',5)
      expect(dg.path_distance('AB')).to eq 5
    end
    it "returns a two-edge distance" do
      dg = Digraph.new
      dg.add_edge('A','B',5)
      dg.add_edge('B','C',7)
      expect(dg.path_distance('ABC')).to eq 12
    end
    it "returns 'not found' if route doesn't exist" do
      dg = Digraph.new
      dg.add_edge('A','B',5)
      dg.add_edge('B','C',7)
      expect(dg.path_distance('ACB')).to eq -1
    end
  end
  describe "#find_routes_by_stops" do
    it "handles an empty route" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      expect(dg.get_route_list('c')).to eq []
    end
    it "finds all 1-stop routes" do
      dg = Digraph.new
      dg.add_edge('A','B',3)
      dg.add_edge('A','C',2)
      dg.get_route_list('A').should =~ [Route.new('AB', 3), Route.new('AC', 2)]
    end
    it "finds 2-stop routes" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      dg.add_edge('a','c',2)
      dg.add_edge('b','c',4)
      dg.get_routes_by_stops('a',2).should =~ [Route.new('ab', 3),Route.new('ac', 2),Route.new('abc', 7)]
    end
    it "finds multiple 2-stop routes" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      dg.add_edge('a','c',2)
      dg.add_edge('b','c',4)
      dg.add_edge('b','d',1)
      dg.get_routes_by_stops('a',2).should =~ [Route.new('ab', 3),Route.new('ac', 2),Route.new('abc', 7),Route.new('abd',4)]
    end
    it "finds a simple 3-stop route" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      dg.add_edge('b','c',4)
      dg.add_edge('c','d',1)
      dg.get_routes_by_stops('a',3).should =~ [Route.new('ab',3),Route.new('abc',7),Route.new('abcd',8)]
    end
    it "finds 4-stop routes" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      dg.add_edge('b','c',4)
      dg.add_edge('c','d',1)
      dg.add_edge('c','e',5)
      dg.add_edge('d','f',7)
      dg.get_routes_by_stops('a',4).should =~ [Route.new('ab',3),Route.new('abc',7),Route.new('abcd',8),Route.new('abce',12),Route.new('abcdf',15)]
    end
    it "excludes longer paths" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      dg.add_edge('b','c',4)
      dg.add_edge('c','d',1)
      dg.add_edge('c','e',5)
      dg.add_edge('d','f',7)
      dg.get_routes_by_stops('a',2).should =~ [Route.new('ab',3),Route.new('abc',7)]
    end
  end
  describe "Dijkstra's algorithm" do
    it "2-nodes" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      shortest_paths = dg.dijkstra('a')
      expect(shortest_paths['b']).to eq 3
    end
    it "3-nodes" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      dg.add_edge('a','c',5)
      dg.add_edge('b','c',1)
      shortest_paths = dg.dijkstra('a')
      expect(shortest_paths['c']).to eq 4
    end
    it "returns shortest path between two nodex" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      dg.add_edge('a','c',5)
      dg.add_edge('b','c',1)
      dg.add_edge('b','d',4)
      dg.add_edge('c','d',2)
      expect(dg.shortest_path('a','d')).to eq 6
    end
    it "3-node cycle" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      dg.add_edge('b','a',1)
      expect(dg.shortest_cycle('a')).to eq 4
    end
    it "4-node cycle" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      dg.add_edge('b','c',1)
      dg.add_edge('c','a',1)
      expect(dg.shortest_cycle('a')).to eq 5
    end
    it "4-node cycle in shortest_path" do
      dg = Digraph.new
      dg.add_edge('a','b',3)
      dg.add_edge('b','c',1)
      dg.add_edge('c','a',1)
      expect(dg.shortest_path('a','a')).to eq 5
    end
  end
end
