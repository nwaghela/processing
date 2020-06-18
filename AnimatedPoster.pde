PFont f;
PFont ff;
String dtext = "everest base camp";
int fontSize = 36;
int headerDelay = 15;
int currentHeaderLetter = 0;

int i=0;
float rotater = 0;
String mytext = "Bangalore Kathmandu Lukla Phakding Namche-Bazar Phortse-Thanga Machhermo Gokyo Dragnag Chola-Pass Dzongla Gorekshep Kala-Patthar Base-Camp";
String [] myArray = split (mytext, " ");
int highlight = 2;
float uMax = height/2-250.0;
float lMin = height/2+250.0;


void setup() {
  size(1920, 1080);
  background(0);
  
  printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", fontSize);
  ff = createFont("AmaticSC-Regular.ttf", fontSize); // 
  textFont(f);
  textAlign(CENTER, CENTER);

}

void draw() {

   drawHeader();
   drawEffect();
   rotatetext();
   
    saveFrame("Poster\\frame-####.tif");  // provide destination folder
    if(frameCount > 500) { // 20 seconds * 25 fps = 500
      noLoop();
    }
    
  }
  
  void drawEffect(){
      if(frameCount % 3!= 0)
        return;
      // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
      float val = randomGaussian();
    
      float sd = 120;                  // Define a standard deviation
      float mean = width/2;           // Define a mean value (middle of the screen along the x-axis)
      float z = ( val * sd ) + mean;  // Scale the gaussian random number by standard deviation and mean
    
      noStroke();
      fill(255,10);
      ellipse(z, height/2, 64, 64);   // Draw an ellipse at our "normal" random location
      
      int margin = 30;
      translate(margin*4, margin*4);
  }
  
  void drawHeader(){
     int gap = 40;
     textFont(f);
     textSize(fontSize);
  
    if (frameCount % headerDelay == 0) {
         currentHeaderLetter++;
         currentHeaderLetter = currentHeaderLetter % dtext.length();
    }
      
    for (int x = 0; x < dtext.length() ; x++) {
  
      char letter = dtext.charAt(x);
  
      if (currentHeaderLetter == x) {
        //fill(255,154,0);
        fill(57,255,20);
      } 
      else if((currentHeaderLetter > 0) && (x % currentHeaderLetter == 0)){
        //fill(189,0,255);
        //fill(255,154,0);
        fill(57,255,20);
      }
      else {
        fill(255);
      }
  
      // Draw the letter to the screen
      text(letter, (width-dtext.length()*gap)/2+x*gap, height/2-150, -30);

    }
  }
  
  void rotatetext(){
      
      float x = random(0,width);
      float y = random(0,height);

      if(frameCount % 2!= 0)
        return;
         
      rotater += .1;
      i++; 
      if(i> (myArray.length-1)){
        i=0;
      }
      
      if(frameCount > 300 && highlight == i){
        fill(255,154,0);
        x = width/2 - 40;
        y = height/2 + 100;
        rotater = 0;
        highlight = -1;
        //fill(57,255,20);
      }
      else
        fill(255,100);  // white text, 25 alpha
      textFont(ff);
      textSize(72);
      translate(x, y);
      rotate (rotater);
      text(myArray[i],0,0);
      //delay(100); // in milliseconds   
  }
  
 
