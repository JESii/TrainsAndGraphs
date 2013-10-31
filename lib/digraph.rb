class Digraph
  attr_reader :vcount
  def initialize
    @digraph = []
    @vcount = 0
  end

  def add_vertex(vname)
    new_node = @digraph[@vcount] = Dignode.new(vname) 
    @vcount += 1
    return new_node
  end

  def add_edge(from, to, distance)
    true
  end

  def distance(from, to)
    5
  end

end

class Dignode < Struct.new (:name)
  attr_reader :name

  def initialize(name)
    @name = name
  end

end
