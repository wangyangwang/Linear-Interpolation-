//Linear Intepolation Sketch
//By Yang Wang
//Draw two points on the screen and you will see a point flying between these points

PVector point_one, point_two, ballPos;
boolean newPoint, ahaschanged;


void setup() {
  size(800, 800, P3D);
  point_one = new PVector(0, 0);
  point_two = new PVector(width, height);
  ballPos = new PVector(0, 0);
  ahaschanged = false;
  newPoint = false;
}

void draw() {
  background(41, 128, 185);
  strokeWeight(1);
  stroke(255);
  line(point_one.x, point_one.y, point_two.x, point_two.y);
  fill(231, 76, 60);
  noStroke();
  ellipse(point_one.x, point_one.y, 20, 20);
  ellipse(point_two.x, point_two.y, 20, 20);
  if (newPoint==true) {
    if (ahaschanged==true) {
      ballPos.set(point_two);
      newPoint = false;
    }
    else {
      ballPos.set(point_one);
      newPoint = false;
    }
  }
  else {
    if (ahaschanged==false && ballPos.x < point_two.x) {
      ballPos.x++;
    }
    if (ahaschanged==false && ballPos.x > point_two.x) {
      ballPos.x--;
    }
  }
  ballPos.y = point_one.y+( (ballPos.x-point_one.x)*point_two.y-(ballPos.x-point_one.x)*point_one.y )
    /(point_two.x-point_one.x);
  strokeWeight(10);
  stroke(44, 62, 80);
  point(ballPos.x, ballPos.y);
}


void mouseClicked() {
  if (ahaschanged==false) {
    point_one.set(mouseX, mouseY);
    newPoint = true;
    ahaschanged = true;
  }
  else {
    point_two.set(mouseX, mouseY);
    newPoint = true;
    ahaschanged = false;
  }
}

