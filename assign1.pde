PImage bg;
PImage soil;
PImage groundhog;
PImage life;
PImage soldier;
PImage robot;

int groundHeight, grassHeight, soldierX, soldierY, soldierSpeed, robotX, robotY, robotSpeed, raserX, raserXleft, raserXright;

void setup() {
  size(640, 480, P2D);
  bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  groundhog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  soldier = loadImage("img/soldier.png");
  robot = loadImage("img/robot.png");

  groundHeight = 80;
  grassHeight = 15;

  soldierY = groundHeight*2 + groundHeight*floor(random(3.99));
  robotX = groundHeight*2+ groundHeight*floor(random(0, 6));
  robotY = groundHeight*2 + groundHeight*floor(random(4));
}

void draw() {
  soldierSpeed = 2;

  background(0);
  //back
  image(bg, 0, 0);
  //sun location
  fill(253, 184, 19);
  strokeWeight(5);
  stroke(255, 255, 0);
  ellipse(width-50, 50, 120, 120);
  //grass
  fill(124, 204, 25);
  noStroke();
  rect(0, groundHeight*2-grassHeight, width, grassHeight);
  //ground
  image(soil, 0, 160);
  //life
  for (int x=0; x<180; x+=70) {
    image(life, x+10, 10);
  }
  //animal
  image(groundhog, groundHeight*3.4, groundHeight);

  //robot random appeared and shoot
  stroke(255, 0, 0);
  strokeWeight(10);
  if(raserXleft>=-185) line(robotX+25+raserXleft, robotY+37, robotX+25+raserXright, robotY+37);
  raserXleft-=2;
  if (raserXleft<-40) raserXright -= 2;
  if(raserXleft<-185) {raserXleft = 0; raserXright = 0;}
  image(robot, robotX, robotY);

  //soldier move around
  image(soldier, soldierX, soldierY);
  soldierX += soldierSpeed;
  if (soldierX>width) soldierX = -50;
  robotSpeed = 2;
}
