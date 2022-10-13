
void pickASpotToDraw() {
  //// pick a random key
  //if (currentHashName == hashMapName1){
  //  loc = int(random(hashMapImage1.size()));
  //}
  //else if (currentHashName == hashMapName2){
  //  loc = int(random(hashMapImage2.size()));
  //}
  // Pick a random point in current image
  x = int(random(img.width));
  y = int(random(img.height));
  loc = x + y*img.width;
}

void rgbaColorLookup() {
  // Look up the RGB color in the source image
  if (currentHashName == hashMapName1) {
    r = red(hashMapImage1.get(loc));
    g = green(hashMapImage1.get(loc));
    b = blue(hashMapImage1.get(loc));
    a = alpha(hashMapImage1.get(loc));
  } else if (currentHashName == hashMapName2) {
    r = red(hashMapImage2.get(loc));
    g = green(hashMapImage2.get(loc));
    b = blue(hashMapImage2.get(loc));
    a = alpha(hashMapImage2.get(loc));
  }
}
