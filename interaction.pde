
float panY = 0, panX = 0;
float treeScale = 1;

void mouseDragged(){
  draw = true;
  panY += (mouseY - pmouseY) / treeScale;
  panX += (mouseX - pmouseX) / treeScale;
}

void mouseWheel(MouseEvent event) {
  draw = true;
  treeScale -= event.getCount() * (0.05 * treeScale);
}

void keyPressed() {
  //Change selectedNode based on key UP or DOWN
  if (keyCode == UP && selectedNode < nodeCount - 1) {selectedNode++; draw = true;}
  if (keyCode == DOWN && selectedNode >= 0) {selectedNode--; draw = true;}
}
