class Dignode < Struct.new(:name, :adj)

  def initialize(name, adj_vertex='', distance=-1)
    self.name = name
    self.adj = {}
    add_adj_vertex(adj_vertex, distance)
  end

  def distance(to)
    return -1 if self.adj[to].nil?
    self.adj.fetch(to)
  end

  def add_adj_vertex(vertex, distance)
    self.adj[vertex] = distance unless vertex == nil
  end

end
