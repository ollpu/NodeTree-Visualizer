NodeTree-Visualizer
===================

A simple tool for visualizing a node tree.


This program visualizes a node tree, defined in the variables of the NodeTree.pde file.

Please note: There has to be one, and only one, master parent node, which all other nodes are children of (directly or indirectly). This node must be node 0.
It is also easy (with small modifications to code) to render multiple trees with different masters.
The project supports node relation loops (ie. 0 has children "1", and 1 has children "0"), because it cuts a branch if the nodes get too small.
    --->>> Watch out! If you zoom in too much, the sketch might crash
If a node is used multiple times, it will appear multiple times, but have the same properties as all other nodes with the same id. (Same color, same children)
