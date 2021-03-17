PImage bg;
PImage soil;
PImage groundhog;
PImage life;
PImage soldier;
PImage robot;

int groundHeight, grassHeight, soldierX, soldierY, soldierSpeed, robotX, robotY, robotSpeed, raserX;

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
  for (int x=0; x<240; x+=80) {
    image(life, x+10, 10);
  }
  //animal
  image(groundhog, groundHeight*3.4, groundHeight);

  //robot random appeared and shoot
  noStroke();
  fill(255, 0, 0);
  rect(robotX+20+raserX, robotY+32, 40, 10, 5);
  raserX -= 2;
  raserX %= groundHeight*2;
  image(robot, robotX, robotY);

  //soldier move around
  image(soldier, soldierX, soldierY);

  soldierX += soldierSpeed;
  soldierX %= width;
  robotSpeed = 2;
}
//
