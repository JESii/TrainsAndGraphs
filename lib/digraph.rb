require 'dignode'

class String
  def last
    return '' if self.size == 0
    self[self.size-1]
  end
end

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
    if find_vertex(from) == false
      self.add_vertex(from) 
      @ecount += 1
    end
    if find_vertex(to) == false
      self.add_vertex(to)
      @ecount += 1
    end
    dn = find_vertex(from)
    dn.add_adj_vertex(to, distance)
    true
  end

  def distance(from, to)
    dn = find_vertex(from)
    dn.distance(to)
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

  def read_graph(infile)
    File.open(infile) do |file|
      file.each_line do |line|
        (from, to, distance) = parse_line(line)
        self.add_edge(from, to, distance)
      end
    end
  end

  def route_distance(route)
    route_list = parse_route(route)
    route_distance = 0
    route_list.each_pair do |key, val|
      tmp = self.distance(key, val)
      return -1 if tmp == -1
      route_distance += tmp
    end
    route_distance
  end

  def get_route_list(start)
    dn = find_vertex(start)
    return -1 if dn == -1
    dn.get_route_list
  end

  def get_routes_from(start,depth)
    routes = get_route_list(start)
    pp "get_routes_from(#{start}): #{routes}"
    routes.each do |route, distance|
      this_node = route[route.size-1]
      next_route_list = get_route_list(this_node)
      next if next_route_list.empty?
      pp next_route_list
      pp next_route_list[0]
      pp next_route_list[0][1]
      next_distance = next_route_list[0][1]
      next_node = next_route_list[0][0].last
      pp "#{this_node}, #{next_route_list}, #{next_node}, #{next_distance}"
      routes << [route[0..route.size-1]+next_node,distance+next_route_list[0][1]]
      pp "routes: #{routes}"
    end
  end

  private

  def parse_route(route)
    route_list = {}
    for i in 0..route.size-2
      route_list[route[i]] = route[i+1]
    end
    route_list
  end

  def parse_line(line)
    from = line[0]
    to = line[1]
    distance = line[2..line.size-1]
    [from, to, distance.to_i]
  end
end
