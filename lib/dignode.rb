
class Dignode < Struct.new(:name, :adj)

  def initialize(name, adj_vertex=nil, distance=0)
    self.name = name
    self.adj = {}
    add_adj_vertex(adj_vertex, distance)
    pp "Dignode#initialize: #{self.name}, #{self.adj}"
  end

  def distance(to)
    self.adj[to]
  end

  def find_edge(to)
    return self.distance if to == self.name
  end

  def add_adj_vertex(vertex, distance)
    self.adj[vertex] = distance
    pp "add_adj_vertex: #{@name}, #{@adj}, #{self.inspect}"
  end

end
