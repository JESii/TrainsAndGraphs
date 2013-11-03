#README

##Background
* I use the Thoughbot convention of avoiding begin blocks in specs; that way, the conditions are clearly obvious at each example.

##Terminology
* 'Path' = character sequence showing nodes visited; e.g., 'ABC'
* 'Route' = an array containing a path and its cumulative distance; e.g., ['ABC', 7]

##Notes/Design Decisions
* Decided to use an adjacency list as opposed to adjacency matrix: Approach works well for smaller digraphs Adjacency matrix would work best with separate matrix library
* When creating an edge, automatically create the vertices, as may be needed.
* Plan to use Enumerables for iterating through the digraph or edges.
* Access to Dignode is always through Digraph; no 'external' use so that Dignode is effectively 'hidden' from eeryone by Digraph # TODO: How to really make this hidden?

