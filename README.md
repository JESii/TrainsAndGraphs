#README

##Running the program
  trains <file-name>
E.g., `trains sample.dat` will run the sample data set and print out the results

##Background / Terminology
* I use the Thoughbot convention of avoiding begin blocks in specs; that way, the conditions are clearly obvious at each example, even though it's not so DRY.
* 'Path' = character sequence showing nodes visited; e.g., 'ABC'
* 'Route' = an Route object containing a path and its cumulative distance; e.g., ['ABC', 7]

##Notes/Design Decisions
* Decided to use an adjacency list as opposed to adjacency matrix: Approach works well for smaller digraphs Adjacency matrix would work best with separate matrix library
* When creating an edge, I automatically create the vertices, as may be needed.
* Access to Dignode is always through Digraph; no 'external' use so that Dignode is effectively 'hidden' from eeryone by Digraph 
* Code was entirely developed using RSpec/TDD.

##API
  Digraph.new() - Initialize the Directed Graph

  #add_vertex(vertex_name)              - Add a vertex to the Digraph
  #add_edge(from, to, distance)         - Add an edge to teh Digraph
                                        Vertices are automatically added as needed
  #node_list()                          - Return the list of all vertices in the Digraph
  #distance(from, to)                   - Return the distance from -> to where to is adjacent to from
  #[index]                              - Return the node at position 'index'
                                        'index' may be a number position in the internal array or a vertex name
  #find_vertex(name)                    - Return the node with the name 'name' or false if not found
  #read_graph(infile)                   - Initialize the Digraph from the given file
  #path_distance(path)                  - Return the total path distance
  #get_route_list(name)                 - Return a routelist for the named node's adjacencies
  #get_routes_by_stops(start, depth)    - Return a list of routes, starting at node 'start' and proceeding 'depth' levels
  #get_routes_by_distance(from, to, ds) - Return a list of routes, starting at 'from' and going to 'to' which have a
                                        total distance >= ds. Cycles are automatically supported.
  #shortest_path(from, to)              - Return the distance of the shortest path from -> to
                                        Cycles are automatically supported.
All other methods are private.                                        
