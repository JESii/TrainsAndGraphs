require 'dignode'

# TODO: Refactor names - using 'route' for different things
#       See path_distance() which says a route is 'ABC'
#       See parse_path() which converts 'ABC' to a hash of 1-edge weighted routes
#       get_routes_from() returns route_list (Array)
#           containing weighted routes (Array[route, distance])
# Essentially difference between 'route' and 'weighted_route'?
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
      next_route = next_route_list[0]
      next_distance = next_route_list[0][1]
      next_node = next_route_list[0][0].last
      #pp "#{this_node}, #{next_route_list}, #{next_node}, #{next_distance}"
      routes << get_one_route_from(route, distance, next_node, next_distance)
      pp "routes: #{routes}"
    end
  end

  private

  def get_one_route_from(route, distance, next_name, next_distance)
    [route[0..route.size-1]+next_name, distance+next_distance]
  end

  def parse_path(path)
    path_list = {}
    for i in 0..path.size-2
      path_list[path[i]] = path[i+1]
    end
    pp "parse_path: #{path_list}"
    path_list
  end

  def parse_line(line)
    from = line[0]
    to = line[1]
    distance = line[2..line.size-1]
    [from, to, distance.to_i]
  end
end
