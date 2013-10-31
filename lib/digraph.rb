class Digraph
  attr_reader :vcount, :ecount
  def initialize
    @digraph = []
    @vcount = 0
    @ecount = 0
  end

  def add_vertex(vname)
    new_node = @digraph[@vcount] = Dignode.new(vname) 
    @vcount += 1
    return new_node
  end

  def add_edge(from, to, distance)
    self.add_vertex(from) if find_vertex(from) == false
    self.add_vertex(to) if find_vertex(to) == false
    @ecount += 1
    true
  end

  def distance(from, to)
    dn = find_vertex(from)
    pp dn
    dn.find_edge(to).distance
  end

  def [] index
    @digraph[index-1]
  end

  def find_vertex(name)
    @digraph.each do |v|
      pp v
      return v if v.name == name
    end
    false
  end

end

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
