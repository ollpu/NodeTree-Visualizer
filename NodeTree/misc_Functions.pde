
//Is a point inside the bounds of a rectangle?
boolean inBounds2D(int pointerX, int pointerY, int bound1X, int bound1Y, int bound2X, int bound2Y) {
  
  return inBounds1D(pointerX, bound1X, bound2X) && inBounds1D(pointerY, bound1Y, bound2Y);
  
}

//Is a point inside the bounds of a line? (1 dimensional)
boolean inBounds1D(int pointer, int bound1, int bound2) {
  
  return pointer >= bound1 && pointer < bound2;
  
}

//This function has been copied from GitHub project eliasjhojala/DMX-lighting-controller (This function has been originally made by me for the mentioned project)
boolean isHoverAB(int obj1X, int obj1Y, int obj2X, int obj2Y){
  //The x and y coordinates of all the dots in the simulated rectangle
  int[] x = new int[4];
  int[] y = new int[4];
  
  x[0] = int(screenX(obj1X, obj1Y));
  y[0] = int(screenY(obj1X, obj1Y));
  x[1] = int(screenX(obj2X, obj1Y));
  y[1] = int(screenY(obj2X, obj1Y));
  x[2] = int(screenX(obj1X, obj2Y));
  y[2] = int(screenY(obj1X, obj2Y));
  x[3] = int(screenX(obj2X, obj2Y));
  y[3] = int(screenY(obj2X, obj2Y));
  
  return inBounds2D(mouseX, mouseY, min(x), min(y), max(x), max(y));
}

