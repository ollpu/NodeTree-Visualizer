//Draws node no. id and calls this function for its children
//Params: id: Id of node to draw, curScale: Scale, so that the function can cut off branches and scale lines properly. (It has to know how large it's draw will actually be)
void drawNodeWChildren(int id, float curScale) {
  
  //Minimun radius of all nodes in pixels
  int minRadius = 2;
  //if current node's radius is smaller than minimum allowed radius (in pixels), break out of this void (return;), canceling the draw of this node and all of it's children (and their children, etc)
  if (curScale * 25 < minRadius / treeScale) return;
  
  
  //Draw ellipse for node
  noStroke();
  fill(nodeR[id], nodeG[id], nodeB[id]);
  switch (renderMode) {
    case 1: ellipse(0, 0, 50, 50); break;
    default: sphere(25); break;
  }
  //Select this node if it is pressed. 
  if (isHoverAB(-25, -25, 25, 25) && mousePressed) { selectedNode = id; }
  if (selectedNode == id) {
    //This node is selected
    pushMatrix();
    noFill();
    stroke(255);
    strokeWeight(4 / curScale / treeScale);
    if (renderMode != 1) translate(0, 0, 10);
    rect(-29, -29, 29*2, 29*2);
    popMatrix();
  }
  
  String[] children = split(nodeChildren[id], ',');
  
  int children_length = children.length;
  
  //Draw child relation lines & call node draw for those nodes
  if (nodeChildren[id] != "") {
    if(id > 0) rotate(radians(- (90 + 180 / children_length / 2)));
    for (int i = 0; i < children_length; i++) {
      if (id > 0) rotate(radians(180 / children_length)); else rotate(radians(360 / children_length));
      
      pushMatrix();
      stroke(nodeR[id], nodeG[id], nodeB[id]);
      fill(nodeR[id], nodeG[id], nodeB[id]);
      //So that the line is always as thick
      strokeWeight(4);
      
      //80, becuase the next nodes offset is 100, and it's scale is 0,8 ---> 0,8 * 100 = 80.
      line(0, 0, 80, 0);
      noStroke();
      translate(100, 0);
      scale(0.8);
      drawNodeWChildren(int(children[i]), curScale * 0.8);
      popMatrix();
      
      
    }
  }
  
  
}
