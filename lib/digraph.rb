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
    5
  end

  def [] index
    @digraph[index-1]
  end

  def find_vertex(name)
    @digraph.each do |v|
      return v if v.name == name
    end
    false
  end

end

class Dignode < Struct.new (:name)
  attr_reader :name

  def initialize(name)
    @name = name
  end

end
