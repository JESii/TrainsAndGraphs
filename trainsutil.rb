module TrainsUtil

  def print_route_distance(path)
    ans = @dg.path_distance(path)
    ans = 'NO SUCH ROUTE' if ans == -1
    "The distance of the route #{path.split('').join('-')} is #{ans}"
  end

end
