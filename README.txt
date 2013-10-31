README
======

Notes/Design Decisions
----------------------
1. Decided to use an adjacency list as opposed to adjacency matrix:
    Approach works well for smaller digraphs
    Adjacency matrix would work best with separate matrix library
2. When creating an edge, automatically create the vertices, as may be needed.
3. Plan to use Enumerables for iterating through the digraph or edges.
