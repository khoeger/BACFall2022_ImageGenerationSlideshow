void recordStartShapeImage (){
  /* 
     record which shape is the start shape
     record which image is the start image
  */
  
  startImage = img;
  //startImageIndex = 
  startShape = shapeType;
}

void reachedStartImageAndShape (){
  
  if (  (  startImage == img ) 
     && (  startShape == shapeType )){
       
       startsSeen += 1;
     } 
     
  if ( startsSeen >= 2){
    println("Done! Reached start image and shape again");
       exit();
  }
}
