//This skecth visualizes a node tree, defined in the variables below

//Please note: There has to be one, and only one, master parent node, which all other nodes are children of (directly or indirectly). This node must be node 0
//It is also easy (with small modifications to code) to render multiple trees with different masters
//The sketch supports node relation loops (ie. 0 has children "1", and 1 has children "0"), because it cuts a branch if the nodes get too small.
    //--->>> Watch out! If you zoom in too much, the sketch might crash
//If a node is used multiple times, it will appear multiple times, but have the same properties as all other nodes with the same id


int nodeCount = 10;


//Node colors
int[] nodeR = new int[nodeCount], nodeG = new int[nodeCount], nodeB = new int[nodeCount];

//List of children a node has
//List format: Value[Seperator ',']Value...
//WARNING: If you use a wrong separator, (ie. ', ') the sketch will throw a RuntimeExpection 
String[] nodeChildren = {"1,2,3", "4,5", "6", "7,8,9", "", "", "", "", "", "0"};


//Changes render mode
//0 = 3D balls, 1 = Performance mode (2D balls), Default 0
int renderMode = 0;


//Runtime edits this variable, it's not necessary to change it

// < 0 = nothing
int selectedNode = 0;


void setup(){
  switch (renderMode) {
    case 1: size(800, 800, P2D); break;
    default: size(800, 800, P3D); break;
  }
  frame.setResizable(true);
  frameRate(30);
  ellipseMode(CENTER);
  smooth();
  
  //Choose random colors for nodes
  for (int i = 0; i < nodeCount; i++) {
    nodeR[i] = int(random(0, 255));
    nodeG[i] = int(random(0, 255));
    nodeB[i] = int(random(0, 255));
  }
}


