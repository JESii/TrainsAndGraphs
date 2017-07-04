# README

## Background / Terminology
* I use the Thoughbot convention of avoiding begin blocks in specs; that way, the conditions are clearly obvious at each example, even though it's not so DRY. Depending on a site's particular coding guidelines, these might need to be refactored with begin blocks and additional context definitions.
* 'Path' = character sequence showing nodes visited; e.g., 'ABC'
* 'Route' = a Route object containing a path and its cumulative distance; e.g., &lt;'ABC', 7>. Occasionally, a degenerate route of the form &lt;'A',0> is used to initiate processing.

##N otes/Design Decisions
* Decided to use an adjacency list as opposed to adjacency matrix: Approach works well for smaller digraphs Adjacency matrix would work best with separate matrix library and for larger, dense graphs. The adjacency lists are used only in Dignode; when passing data to an external user, Dignode creates a route list of the form: [&lt;'AB', 3>, &lt;'AC',4>,...]
* When creating an edge, any required vertices are created as needed.
* Access to Dignode is always through Digraph; no 'external' use so that Dignode is effectively 'hidden' from eeryone by Digraph 
* Code was entirely developed using RSpec/TDD.
* Spec'ing this out led me to a solution that didn't include the classic DFS or BFS implementation. Instead, I wound up implementing an algorithm to directly handle the case of routes with n stops (get&#95;routes&#95;by&#95;stops) and that naturally led to a similar approach for the distance problem (get&#95;routes&#95;by&#95;distance). Were I to consider further work, I might well refactor this to use the more common approach.
* The Dijkstra algorithm to find all shortest paths between two nodes was implemented based on material in the book "The Algorithm Design Manual" using the standard approach. That method has not been refactored, but has been left in the canonical form.

## Running the sample program
###  trains &lt;file-name>
E.g., <br />
&nbsp;&nbsp;trains sample.dat<br />
will run the sample data set and print out the results

## API
<dl>
<dt><em><b>Digraph.new() </b></em>
<dd>Initialize the Directed Graph
<hl>
<dt><em><b>#add_vertex(vertex_name)</b></em>
<dd>Add a vertex to the Digraph
<dt><em><b>#add_edge(from, to, distance)</b></em>
<dd>Add an edge to the Digraph; Vertices are automatically added as needed
<dt><em><b>#node_list()</b></em>
<dd>Return the list of all vertices in the Digraph
<dt><em><b>#distance(from, to)</b></em>
<dd>Return the distance from -> to where to is adjacent to from
<dt><em><b>#[index]</b></em>
<dd>Return the node at position 'index'; 'index' may be a number position in the internal array or a vertex name
<dt><em><b>#find_vertex(name)</b></em>
<dd>Return the node with the name 'name' or false if not found
<dt><em><b>#read_graph(infile)</b></em>
<dd>Initialize the Digraph from the given file
<dt><em><b>#path_distance(path)</b></em>
<dd>Return the total path distance
<dt><em><b>#get_route_list(name)</b></em>
<dd>Return a routelist for the named node's adjacencies
<dt><em><b>#get_routes_by_stops(start, depth)</b></em>
<dd>Return a list of routes, starting at node 'start' and proceeding 'depth' levels
<dt><em><b>#get_routes_by_distance(from, to, distance)</b></em>
<dd>Return a list of routes, starting at 'from' and going to 'to' which have a total distance >= distance. Cycles are automatically supported.
<dt><em><b>#shortest_path(from, to)</b></em>
<dd>Return the distance of the shortest path from -> to. Cycles are automatically supported.
</dl>
All other methods are private.                                        
