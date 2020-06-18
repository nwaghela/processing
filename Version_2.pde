float beginX = 959;  // Initial x-coordinate
float beginY = 807;  // Initial y-coordinate
float endX = 1194;   // Final x-coordinate
float endY = 328;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 4;   // Determines the curve
float x = beginX;        // Current x-coordinate
float y = beginY;        // Current y-coordinate
float step = 0.008;    // Size of each step along the path
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)
PImage img;

float count = 0;
boolean increase = true;
float textC = 23;
float text1H = textC;
float text2H = textC;
float bubble = 0.2;

String folder = "C:\\Users\\nwaghela\\Videos\\EBC\\Kathmandu";
int numFrames = 150;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];


void setup() {
  size(1920, 1080);
  frameRate(24);
  for (int i = 0; i < numFrames; i++) {
    String imageName = folder+ "\\footage\\Kathmandu_" + nf(i, 3) + ".jpeg";
    images[i] = loadImage(imageName);
  }
  noStroke();
}

void draw() {
  tint(255, 40);
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  image(images[currentFrame], 0, 0);


  //stroke(225, 225, 225);
  //text1H=bubbleText(10,50,text1H);
  //textSize(text1H);
  //changeFill(text1H);
  //text("Bangalore", beginX-135, beginY+10);
  //fill(0, 2); 
  //rect(0, 0, width, height);
  //pct += step;
  //if (pct < 1.0) {
  //  x = beginX + (pct * distX);
  //  y = beginY + (pow(pct, exponent) * distY);
  //}

 
  
  //stroke(225, 225, 225);
  //strokeWeight(3.0);
  //strokeCap(PROJECT);
  //curveTightness(-5.0);

  //curve(beginX, beginY, beginX, beginY, x, y, x, y);
  
  //noStroke();
  //ellipseMode(RADIUS); 
  //fill(225, 225, 255);
  //ellipse(x, y, 10, 10);
  
  //ellipseMode(CENTER);
  //fill(255, 255, 255);
  //ellipse(x, y, 14, 14);
  
  //stroke(225, 225, 225);
  //text2H=bubbleText(120,160,text2H);
  //textSize(text2H);
  //changeFill(text2H);
  //text("Kathmandu", endX-160, endY+10);
  

  
  //saveFrame(folder+"\\frame-####.tif");
  if(frameCount > 150) { // 20 seconds * 25 fps = 500
    noLoop();
  }
  
}

float bubbleText(float startFrame, float endFrame, float currentSize){
    if(frameCount > startFrame && frameCount < endFrame){
     if(increase){
       count +=1;
       currentSize += bubble;
       if(count > (endFrame-startFrame)/2 ){
         increase = false;
       }
     }
     if(!increase){
       count -=1;
       currentSize -= bubble;
       if(count < 0){
         increase = true;
       }
     }
  }
  else{
    currentSize = textC;
  }
  
  return currentSize;
}

void changeFill(float currentH){
  if(currentH > textC){
    fill(225, 110, 45);
  }
  else{
    fill(225, 225, 225);
  }
  
}

void mousePressed() {
  pct = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
  print("Clicked at (xy) >", endX, endY);
}
