



int pressX, pressY;
boolean pressing = false, oldPressing = false;

void draw(){
  
  if(renderMode != 1) lights();
  
  
  
  //----------NODES-----------//
    
    //Draw background
    background(0);
    
    pushMatrix();
    //translate to center
    switch (renderMode) {
      case 1: translate(width/2, height/2); break;
      default: translate(width/2, height/2, -25 * treeScale); break;
    }
    //Scale by scale values
    scale(treeScale);
    //Translate everything by mouse drag values
    translate(panX, panY);
    drawNodeWChildren(0, 1);
    popMatrix();
    
  
  //-------END: NODES-------//
  
  
  //-----------GUI-------------//
  if (pressing == false && mousePressed) {pressing = true; pressX = mouseX; pressY = mouseY;}
  if (pressing == true && !mousePressed) pressing = false;
  
  noStroke();
  
  //Draw bottom widget
  pushMatrix();
  translate(0, height - 100);
  fill(80);
  rect(0, 0, width, 100);
  fill(255);
  text("Zoom: " + str(treeScale), 10, 20);
  text("Pan X: " + str(panX), 10, 40);
  text("Y: " + str(panY), 150, 40);
  
  //-HOME BUTTON-//
  //Draw & check "Home" button
  // 0 = nothing, 1 = hover, 2 = pressed down
  int homeButtonState = 0;
  boolean isOver = false;
  if (inBounds2D(mouseX, mouseY, 10, height - 100 + 60, 10 + 80, height - 100 + 60 + 30)) isOver = true;
  if (pressing == false && isOver) homeButtonState = 1;
  if (isOver && pressing && inBounds2D(pressX, pressY, 10, height - 100 + 60, 10 + 80, height - 100 + 60 + 30)) homeButtonState = 2;
  
  if (isOver && pressing == false && oldPressing == true && (pressY >= height - 100 + 60 && pressY < height - 100 + 60 + 30) && (pressX >= 10 && pressX < 10 + 80)) {
    //Button has been pressed -> set pan & scale to defaults and make sure nodes are redrawn
    panX = 0; panY = 0;
    treeScale = 1;
  }
  
  switch (homeButtonState) {
    case 1:
      fill(200, 0, 0);
      break;
    case 2: 
      fill(255, 10, 10);
      break;
    default:
      fill(150, 0, 0);
      break;
  }
  rect(10, 60, 80, 30);
  fill(255);
  text("Go Home", 15, 60 + 30/2);
  
  //-END: HOME BUTTON-//
  
  //separator line
  
  stroke(255);
  strokeWeight(2);
  line(250, 0, 250, 100);
  
  //-SELECTED NODE PROPERTIES-//
  
  pushMatrix();
  translate(250, 0);
  
  if (selectedNode >= 0) {
    text("Selected node ID: " + selectedNode, 15, 20);
    text("Children: " + nodeChildren[selectedNode], 15, 40);
    text("Color: R: " + nodeR[selectedNode] + " G: " + nodeG[selectedNode] + " B: " + nodeB[selectedNode], 15, 60);
    fill(nodeR[selectedNode], nodeG[selectedNode], nodeB[selectedNode]);
    noStroke();
    rect(15, 70, 20, 20);
  }
  popMatrix();
  
  //-END: SELECTED NODE PROPERTIES-//
  
  popMatrix();
  //-------END: GUI--------//
  
  oldPressing = pressing;
}
