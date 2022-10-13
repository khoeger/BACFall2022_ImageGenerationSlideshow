import java.util.Map;

PImage img, img1, img2;
String[] imageStringArray = {"Pink_4497.png", 
  "Blue_4504.png", 
  "playgroundTower_colorCorrections.jpg", 
  "playgroundTower_waterpark_colorCorrections.jpg"};
ArrayList<PImage> imageArray;
ArrayList<HashMap> hashMapArray;
String imageString1 = "E:/Projects/BAC_Fall_2022/SourceImages_ReconsitutedMedia/Pink_4497.png";
//String imageString2 = "E:/Projects/BAC_Fall_2022/SourceImages_ReconsitutedMedia/Blue_4504.png";
//String imageString1 = "E:/Projects/BAC_Fall_2022/SourceImages_ReconsitutedMedia/playgroundTower_colorCorrections.jpg";
//String imageString2 = "E:/Projects/BAC_Fall_2022/SourceImages_ReconsitutedMedia/playgroundTower_waterpark_colorCorrections.jpg";
String imageStringBase = "E:/Projects/BAC_Fall_2022/SourceImages_ReconsitutedMedia/";
String imageType = ".png";
String imageName = "balloonTest";
String currentHashName;
int currentIndex;
String hashMapName1 = "hashMap1";
String hashMapName2 = "hashMap2";

HashMap<Integer, Integer> hashMapImage1, hashMapImage2;

color baseColor = color(0);

float proportion = 0.0175;

float scalar = 1;

int seed = 20220913;

int[] img1Pixels, img2Pixels;

PFont myFont;
String fontName = "Twenty-Five Normal";
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

String[] shapeOptions = { 
  "circle", // 0
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
  ////"word"
};
String shapeType = shapeOptions[int(random(shapeOptions.length))];//15];
String prefix = str(year())+str(month())+str(day())+str(hour())+str(minute())+"/";

int countDots =0;
void setup() {
  size(displayWidth, displayHeight);
  //size(1000, displayHeight);

  background(baseColor);

  imageArray = new ArrayList<PImage>();
  hashMapArray = new ArrayList< HashMap >();
  for (int currentImageIndex = 0; currentImageIndex < imageStringArray.length; currentImageIndex ++ ) {
    String currentImageName = imageStringBase + imageStringArray[currentImageIndex];
    img = loadImage( currentImageName );
    img.resize( width  - 2 * borderSpace, 
      height - 2 * borderSpace );
    imageArray.add(img);

    img.loadPixels();

    hashMapArray.add( new HashMap<Integer, Integer >());

    for ( int pixelNumber = 0; pixelNumber < img.pixels.length; pixelNumber ++) {
      hashMapArray.get( currentImageIndex).put(pixelNumber, img.pixels[pixelNumber]);
    }

    currentHashName = currentImageName;
  }

  img = imageArray.get(floor(random(imageArray.size())));


  smooth();
  noStroke();
  randomSeed(seed);



  myFont = createFont(fontName, floor( 0.45*min(width, height)));
  textFont(myFont);

  println("Start Time:", str(hour())+":"+ str(minute())+":"+str( second()));


  // Calculate max frames
  maxFramesNow();

  setShapeModes();
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
