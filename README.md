# Outerplanar-graph
The Matlab code is used to generate all maximal outerplanar graphs of order
n with $6\leq n\leq16$, and the graphs with maximum spectral radius for each $n$.
Let $A$ denote the three-dimensional matrix which contains the adjacency matrices of
all maximal outerplanar graphs of order $r$, and $B$ the matrix whose $k$-th row represents
the label of the unique Hamiltonian cycle of the graph with respect to the $k$-th matrix of $A$.
Then, in the function $[A1,B1,C1]=max_out(A,B)$, $A1$ returns the adjacency matrices
of all maximal outerplanar graphs of order $r+1$ (there might be some isomorphic ones for
$r\geq13$), $B1$ is similar as $B$ and corresponds to $A1$, and $C1$ returns the adjacency matrices
of those graphs (up to isomorphism) with maximum spectral radius among all maximal
outerplanar graphs of order $r+1$.
