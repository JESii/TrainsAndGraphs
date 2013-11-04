require 'dignode'

# Definitions:
# 1. 'Path' = character sequence showing nodes visited
# 2. 'Route' = [path, distance]

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
    # TODO: Consider returning the the node instead of 'true'
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

  def node_list
    @digraph.map { |v| v.name }
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

  def path_distance(path)
    path_list = parse_path(path)
    path_distance = 0
    path_list.each_pair do |key, val|
      tmp = self.distance(key, val)
      return -1 if tmp == -1
      path_distance += tmp
    end
    path_distance
  end

  def get_route_list(start)
    dn = find_vertex(start)
    return [] if dn == false
    dn.get_route_list
  end

  def get_routes_from(start, depth)
    routes = []
    next_route_list = [Route.new(start, 0)]
    (1..depth).each do |level|
      next_route_list = get_routes_from_route_list(next_route_list)
      routes << next_route_list
    end
    routes.flatten
  end

  def get_routes_from_route_list(route_list)
    result = []
    route_list.each do |route|
      this_route_list = get_route_list(route.path.last)
      next if this_route_list.empty?
      result << get_routes_from_node_list(route,this_route_list)
    end
    result.flatten
  end

  def get_routes_from_node_list(route,route_list)
    result = []
    route_list.each do |next_route|
      result << get_one_route_from(route, next_route)
    end
    result.flatten
  end

  def dijkstra(graph, from, to)
    node_list = graph.node_list
    0
  end

  private

  def get_one_route_from(route, next_route)
    raise 'UnMatched Routes' if route.path.last != next_route.path[0] && next_route.path.size != 2
    Route.new(route.path[0..route.path.size-1] + next_route.path.last, route.distance + next_route.distance)
  end

  def parse_path(path)
    path_list = {}
    for i in 0..path.size-2
      path_list[path[i]] = path[i+1]
    end
    path_list
  end

  def parse_line(line)
    from = line[0]
    to = line[1]
    distance = line[2..line.size-1]
    [from, to, distance.to_i]
  end
end
