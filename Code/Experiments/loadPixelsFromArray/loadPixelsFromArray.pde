PImage img1, img2;
String imageString1 = "E:/Projects/BAC_Fall_2022/SourceImages_ReconsitutedMedia/Pink_4497.png";
String imageString2 = "E:/Projects/BAC_Fall_2022/SourceImages_ReconsitutedMedia/Blue_4504.png";

void setup(){
    size(2000,1000);
    img1 = loadImage(imageString1);
    img2 = loadImage(imageString1);
    img1.resize( width, height);
    img2.resize( width, height);
    rectMode(CENTER);
}


void draw(){
    background(0);
    image(img1, 0, 0);
    int location = int(random(width*height));
    int pixelColor1= img1.pixels[location];
    int pixelColor2= img2.pixels[location];
    
    noStroke();
    fill(pixelColor1);
    rect( width/2-100, height/2, 100, 100);
    fill(pixelColor2);
    rect( width/2+100, height/2, 100, 100);
}
