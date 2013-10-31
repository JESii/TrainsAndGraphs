class Dignode < Struct.new(:name, :adj)

  def initialize(name, adj_vertex=nil, distance=0)
    self.name = name
    self.adj = {}
    add_adj_vertex(adj_vertex, distance)
  end

  def distance(to)
    self.adj.fetch(to)
  end

  def find_edge(to)
    return self.distance if to == self.name
  end

  def add_adj_vertex(vertex, distance)
    self.adj[vertex] = distance unless vertex == nil
  end

end
