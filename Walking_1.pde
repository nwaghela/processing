
PGraphics alphaG;
Zoog zoog;
float a = 0;
float b = 0;

String folder = "C:\\Users\\nwaghela\\Videos\\EBC\\Phakding\\footage_2\\man";
int start = 200;
int numFrames = 400;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];

void setup() {

  size(1920, 1080);
  alphaG = createGraphics(width,height);
  background(255);
  a = 1660; //760
  b = 740;  // 510
  frameRate(30);
  //for (int i = start; i < numFrames+start; i++) {
  //  String imageName = folder+ "\\Phakding_" + nf(i, 3) + ".jpeg";
  //  images[i-start] = loadImage(imageName);
  //}
  zoog = new Zoog(a, b, 60, 60, 16);
}

void draw() {
   background(255);
  //image(images[currentFrame], 0, 0);
  //currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  // mouseX position determines speed factor
  //float factor = constrain(mouseX/10, 0, 5);
  //alphaG.clear();
  alphaG.beginDraw();
    alphaG.clear();
    alphaG.fill(255,100);
    goTo();
  zoog.display();
  alphaG.endDraw();
  image(alphaG, 0,0);
  //saveFrame(folder+"\\frame-####.tif");
  alphaG.save(folder+"\\frame-"+nf(frameCount, 3)+".png");
  if(frameCount > numFrames) { // 20 seconds * 25 fps = 500
    noLoop();
  }
}

void goTo(){
  

  if(frameCount > 343){
      a = 300  + 7.5*(frameCount-343) ; 
      b= 830  - 4.6*(frameCount-343);
  }
  else if(frameCount>310){
      a = 1330 - (frameCount-310); 
      b= 825 - (frameCount-310); 
  }
  else if(frameCount>200){
      a = 645 - 3*(frameCount-200);
      b= 775 - (frameCount-200);
  }
  else if(frameCount>100){
      a = 870 - (frameCount-100);
      b= 545 - 3*(frameCount-100);
  }
  else if(frameCount>10){
      a = 1290 - (frameCount-10);
      b= 645 - (frameCount-10);
  }
  else {
      a = a - 40;
      b = b - 100;
  }
  
  
  float factor = constrain(mouseX/10, 0, 5);


  zoog.jiggle(a,b, factor);
}

class Zoog {
  // Zoog's variables
  float x, y, w, h, eyeSize;

  // Zoog constructor
  Zoog(float tempX, float tempY, float tempW, float tempH, float tempEyeSize) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    eyeSize = tempEyeSize;
  }

  // Move Zoog
  void jiggle(float x1, float y1, float speed) {
    // Change the location of Zoog randomly
    x = x1+random(-1, 1)*speed;
    y = y1+random(-1, 1)*speed;
    // Constrain Zoog to window
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }

  // Display Zoog
  void display() {
    // Set ellipses and rects to CENTER mode
    alphaG.ellipseMode(CENTER);
    alphaG.rectMode(CENTER);
    alphaG.fill(0);
    // Draw Zoog's arms with a for loop
    for (float i = y - h/3; i < y + h/2; i += 10) {
      alphaG.stroke(0);
      alphaG.line(x-w/4, i, x + w/4, i);
    }
    // Draw Zoog's body
    alphaG.stroke(0);
    alphaG.fill(231, 76, 60);
    alphaG.rect(x, y, w/6, h);
    // Draw Zoog's head
    alphaG.stroke(0);
    
    
    alphaG.fill(247, 220, 111);
    alphaG.ellipse(x, y-h, w, h);
    
    
    // Draw Zoog's eyes
    alphaG.fill(127, 179, 213);
    alphaG.ellipse(x-w/3, y-h, eyeSize, eyeSize*2);
    alphaG.ellipse(x + w/3, y - h, eyeSize, eyeSize*2);
    // Draw Zoog's legs
    alphaG.stroke(0);
    alphaG.fill(0);
    alphaG.line(x - w/12, y + h/2, x - w/4, y + h/2 + 10);
    alphaG.line(x + w/12, y + h/2, x + w/4, y + h/2 + 10);
    
    // debug
    alphaG.fill(0);
    alphaG.textSize(20);
    alphaG.text(frameCount,x-10,y-h);
  }
}
