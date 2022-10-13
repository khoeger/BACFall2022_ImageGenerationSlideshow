void maxFramesNow() {      // calculate the number of frames to draw
  maxFrames = ceil(( width * height / (shapeWidth * shapeHeight))*proportion);
}

void incrementValues() {
  // increment / reset values
  alphaValue += 1;    // make paint more solid
  shapeWidth -= shapeWidthIncrement;     // decrease shape size
  shapeHeight -= shapeHeightIncrement;  
  spotsDrawn = 0;  // restart frame/shape counter - 1 shape per frame
  //components[0].resize(0, shapeWidth); // resize image
  //components[1].resize(0, shapeWidth); // resize image
  textSize( max(shapeWidth, shapeHeight) );
  //println("alpha:", alphaValue, "runtime:", str(millis()* 1/1000 * 1/60)+" minutes");
}

void terminationCheck() {
  // We've drawn all the dots - the paint can't get any more solid / less opaque
  if (alphaValue >= 255) {
    println("DONE!", proportion, str(millis()* 1/1000 * 1/60)+" minutes" );// millis * 1/1000 = seconds ; seconds * 1/60 = minutes
    // save to documentation
    //saveFrame("documentation/"+shapeType+"/"+imageName+"_"+shapeType+"_"+str(proportion)+"_canvas"+str(width)+"x"+str(height)+"_"+hex(baseColor)+"_max"+str(maxShapeWidth)+"_min"+str(shapeWidth)+"x"+str(shapeHeight)+".jpg");
    //println("Saved to");
    //println("documentation/"+shapeType+"/"+imageName+"_"+shapeType+"_"+str(proportion)+"_canvas"+str(width)+"x"+str(height)+"_"+hex(baseColor)+"_max"+str(maxShapeWidth)+"_min"+str(shapeWidth)+"x"+str(shapeHeight)+".jpg");

    //exit();
    //println(img, img1, img2);
    if(currentHashName == hashMapName1){
      println("1rst Image");
      img = img2;
      currentHashName = hashMapName2;
      println(currentHashName);
      resetValues();
    }
    else if (currentHashName == hashMapName2){
      println("2nd Image");
      img = img1;
      currentHashName = hashMapName1;
      println(currentHashName);
      resetValues();
    }
  } else {
    maxFramesNow();     // calculate number of shapes should draw next
  }
}
String resetValues(){
  alphaValue = 0;
  shapeWidth = maxShapeWidth;
  shapeHeight = maxShapeHeight;
  spotsDrawn = 0;
  shapeType = shapeOptions[int(random(shapeOptions.length))];//15];
  return("Values Reset");
}
