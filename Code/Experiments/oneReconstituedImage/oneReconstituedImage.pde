import java.util.Map;

PImage img, img1, img2;
String imageString1 = "E:/Projects/BAC_Fall_2022/SourceImages_ReconsitutedMedia/Pink_4497.png";
String imageString2 = "E:/Projects/BAC_Fall_2022/SourceImages_ReconsitutedMedia/Blue_4504.png";
String imageType = ".png";
String imageName = "balloonTest";
String currentHashName;
String hashMapName1 = "hashMap1";
String hashMapName2 = "hashMap2";

HashMap<Integer,Integer> hashMapImage1, hashMapImage2;

color baseColor = color(0);

float proportion = 0.0175;

float scalar = 1;

int seed = 20220913;

int[] img1Pixels, img2Pixels;

PFont myFont;
String[] wordArray = {"BETHANY"};

int maxShapeWidth = 256;
int maxShapeHeight = maxShapeWidth;
int shapeWidthIncrement = 1;
int shapeHeightIncrement = shapeWidthIncrement;

int borderSpace = 150;

int x, y, loc;
float r, g, b, a;
int maxFrames;

int alphaValue = 0;
int spotsDrawn = 0;
int shapeWidth = maxShapeWidth;
int shapeHeight = maxShapeHeight;

String[] shapeOptions = { "circle", // 0
  "ellipse", // 1  
  "ellipseRotate", // 2 
  //"imageIn", // 3
  //"imageInRotate", // 4
  //"imageInRotateFlip", // 5 BROKEN?
  "line", // 6
  "lineRotate", // 7
  "lineWeight", // 8
  "lineWeightRotate", // 9 
  "rect", // 10 
  "rectRotate", // 11
  "triangle", // 12
  "triangleRotate", // 13
  "square", // 14 
  "squareRotate", //15
  "word"
};
String shapeType = shapeOptions[0];//15];
String prefix = str(year())+str(month())+str(day())+str(hour())+str(minute())+"/";


void setup() {
  size(displayWidth, displayHeight);
 
  hashMapImage1 = new HashMap < Integer, Integer>();
  hashMapImage2 = new HashMap < Integer, Integer>();

  img1 = loadImage(imageString1);
  img2 = loadImage(imageString2);
  img1.resize( width  - 2 * borderSpace, 
    height - 2 * borderSpace );
  img2.resize( width  - 2 * borderSpace, 
    height - 2 * borderSpace );
  
  img = img1;
  img1.loadPixels();
  hashMapImage1 = new HashMap < Integer, Integer>();
  for( int pixelNumber = 0; pixelNumber < img1.pixels.length ; pixelNumber ++){
    hashMapImage1.put( pixelNumber, img1.pixels[pixelNumber]);
  }
  img2.loadPixels();
  hashMapImage2 = new HashMap < Integer, Integer>();
  for( int pixelNumber = 0; pixelNumber < img2.pixels.length ; pixelNumber ++){
    hashMapImage2.put( pixelNumber, img2.pixels[pixelNumber]);
  }
  currentHashName = hashMapName1;
  
  
  smooth();
  noStroke();
  randomSeed(seed);

  background(baseColor);

  myFont = createFont("Twenty-Five Normal", floor( 0.45*min(width, height)));
  textFont(myFont);

  println("Start Time:", str(hour())+":"+ str(minute())+":"+str( second()));


  // Calculate max frames
  maxFramesNow();

  setShapeModes();


  //println(img.width, img1.width);
}


void draw() {

  // -- Draw all sole spots of their size
  if ( maxFrames == 1) {

    push();
    //translate(borderSpace, borderSpace);           // shift for border -- WORDS

    pickASpotToDraw();                             // choose place
    rgbaColorLookup();                             // get color data
    drawShape();                                   // draw shape at location
    spotsDrawn += 1;                               // increment number of spotsDrawn

    // end shift for border
    pop();
    //println(alphaValue, maxFrames);                // print statement
    //saveNamedFrame();                              // record
    incrementValues();                             // get values ready for next shape

    terminationCheck();                            // check - are we done?
  } else {
    // -- Draw multiple spots of same size

    // Draw all spots of size shapeWidth, shapeHeight
    while ( spotsDrawn % maxFrames < maxFrames -1) { 
      push();                                        // BEGIN for border -- WORDS
      //translate(borderSpace, borderSpace);           // shift for border -- WORDS

      pickASpotToDraw();                             // choose place
      rgbaColorLookup();                             // get color data
      drawShape();                                   // draw shape at location
      spotsDrawn += 1;                               // increment number of spotsDrawn

      pop();                                         // END shift for border -- WORDS
    }

    // After drawing all spots
    if (spotsDrawn % maxFrames == maxFrames - 1 ) {
      //println(alphaValue, maxFrames);                // print statement
      //saveNamedFrame();                              // record
      incrementValues();                             // get values ready for next shape

      terminationCheck();                            // check - are we done?
    }
  }
}
