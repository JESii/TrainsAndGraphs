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

end

class Dignode < Struct.new (:vname)
  attr_reader :vname

  def initialize(vname)
    @vname = vname
  end

end
