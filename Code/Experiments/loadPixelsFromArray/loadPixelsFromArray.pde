/* 
    A file that practices creating pixel arrays
*/

// Declare Images
PImage img1, img2;
// Name Image Filepaths
String imageString1 = "E:/Projects/BAC_Fall_2022/SourceImages_ReconsitutedMedia/Pink_4497.png";
String imageString2 = "E:/Projects/BAC_Fall_2022/SourceImages_ReconsitutedMedia/Blue_4504.png";

void setup(){
    // Create canvas
    size(2000,1000);
    // Load Images
    img1 = loadImage(imageString1);
    img2 = loadImage(imageString1);
    // Resize Images
    img1.resize( width, height);
    img2.resize( width, height);
    // Center squares
    rectMode(CENTER);
}


void draw(){
    // Draw background
    background(0);
    // Draw image
    image(img1, 0, 0);
    // Choose random location on image
    int location = int(random(width*height));
    // Find location in pixel array
    int pixelColor1= img1.pixels[location];
    int pixelColor2= img2.pixels[location];
    
    // Draw squares showing pixel color
    noStroke();
    fill(pixelColor1);
    rect( width/2-100, height/2, 100, 100);
    fill(pixelColor2);
    rect( width/2+100, height/2, 100, 100);
}
