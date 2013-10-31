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

