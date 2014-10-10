
//Is a point inside the bounds of a rectangle?
boolean inBounds2D(int pointerX, int pointerY, int bound1X, int bound1Y, int bound2X, int bound2Y) {
  
  return inBounds1D(pointerX, bound1X, bound2X) && inBounds1D(pointerY, bound1Y, bound2Y);
  
}

//Is a point inside the bounds of a line? (1 dimensional) // sorry for 1(direeeaactiroon)...
boolean inBounds1D(int pointer, int bound1, int bound2) {
  
  return pointer >= bound1 && pointer < bound2;
  
}
