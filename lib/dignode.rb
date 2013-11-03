require 'route'

class Dignode < Struct.new(:name, :adj)

  def initialize(name, adj_vertex=nil, distance=-1)
    self.name = name
    self.adj = {}
    add_adj_vertex(adj_vertex, distance) unless adj_vertex == nil
  end

  def distance(to)
    return -1 if self.adj[to].nil?
    self.adj.fetch(to)
  end

  def add_adj_vertex(vertex, distance)
    self.adj[vertex] = distance
  end

  def get_adj_list
    self.adj
  end

  def get_route_list
    result = []
    name = self.name
    self.adj.each_pair do |key,val|
      result << Route.new(name+key,val)
    end
    result
  end
end
