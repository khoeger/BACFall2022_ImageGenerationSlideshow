void setShapeModes() {
  if ( (( shapeType == "circle" ) || 
    ( shapeType == "ellipse" )) || 
    (  shapeType == "ellipseRotate" )
    ) {
    proportion = baseProportion;
    ellipseMode(CENTER);
  } else if ( (( shapeType == "imageIn" ) || 
    ( shapeType == "imageInRotate" )) || 
    (  shapeType == "imageInRotateFlip" )
    ) {
    proportion = baseProportion;
    imageMode(CENTER);
  } else if ( ((( shapeType == "rect" ) || 
    ( shapeType == "rectRotate" )) || 
    ( shapeType == "square" )) ||
    ( shapeType == "squareRotate")
    ) {
    rectMode(CENTER);
    proportion = baseProportion;
  } else if ( ((( shapeType == "line" ) || 
    ( shapeType == "lineRotate" )) || 
    ( shapeType == "lineWeight" )) ||
    ( shapeType == "lineWeightRotate")
    ) {
    proportion = pow(baseProportion, 0.75);
  } else if (shapeType == "word") {
    //textMode(CENTER);
    proportion = baseProportion;
    textAlign(CENTER, CENTER);
  }

  //  "triangle", // 12
  //  "triangleRotate", // 13
}

void drawShape() {
  // Draw an ellipse at that location with that color
  scale(scalar);
  if (a == 0) {                            // if over transparent background
  } else {
    
    offscreen.beginDraw();

    if (shapeType == "circle") {
      push();                                        // shift for border , 
      offscreen.translate(borderSpace, borderSpace);
      //push();
      offscreen.translate(x, y );
      offscreen.fill(r, g, b, alphaValue);
      offscreen. ellipse(0, 0, min(shapeWidth, shapeHeight), min(shapeWidth, shapeHeight));
      //pop();
      pop();
    } else if (shapeType == "ellipse") {
      push();                                        // shift for border 
       offscreen.translate(borderSpace, borderSpace);
      push();
       offscreen.translate(x, y );
       offscreen.fill(r, g, b, alphaValue);
       offscreen.ellipse(0, 0, shapeWidth, shapeHeight);
      pop();
      pop();
    } else if (shapeType == "ellipseRotate") {
      push();                                        // shift for border 
       offscreen.translate(borderSpace, borderSpace);
      push();
       offscreen.translate(x, y );      
       offscreen.rotate(random(2*PI));
       offscreen.fill(r, g, b, alphaValue);
       offscreen.ellipse(0, 0, shapeWidth, shapeHeight);
      pop();
      pop();
    } /*else if (shapeType == "imageIn") {
     push();                                        // shift for border 
     translate(borderSpace, borderSpace);
     push();
     tint(r, g, b, alphaValue);
     translate( x, y );      
     image(components[round(random(-0.49, 1.49))], 0, 0);
     pop();
     pop();
     } else if (shapeType == "imageInRotate") {
     push();                                        // shift for border 
     translate(borderSpace, borderSpace);
     push();
     tint(r, g, b, alphaValue);
     translate(x, y);
     rotate(random(2*PI));
     image(components[round(random(-0.49, 1.49))], 0, 0);
     pop();
     pop();
     } else if (shapeType == "imageInRotateFlip") {
     push();                                        // shift for border 
     int[] options = {-1, 1};
     translate(borderSpace, borderSpace);
     push();
     translate(x, y);      
     rotate(random(2*PI));
     push();
     if (random(1) < 0.5) {
     scale( options[int(random(options.length))], 1);
     } else {
     scale( 1, options[int(random(options.length))]);
     }
     tint(r, g, b, alphaValue); 
     image(components[round(random(-0.49, 1.49))], 0, 0);
     pop();
     pop();
     pop();
     } */
    else if (shapeType == "line") {
      push();                                        // shift for border 
       offscreen.translate(borderSpace, borderSpace);
      push();
       offscreen.translate( x, y );      
       offscreen.stroke(r, g, b, alphaValue);
       offscreen.line(-shapeWidth/2, -shapeHeight/2, shapeWidth/2, shapeHeight/2);
      pop();
      pop();
    } else if (shapeType == "lineRotate") {
      push();                                        // shift for border 
       offscreen.translate(borderSpace, borderSpace);
      push();
       offscreen.translate( x, y );      
       offscreen.stroke(r, g, b, alphaValue);
       offscreen.rotate(random(2*PI));
       offscreen.line(-shapeWidth/2, -shapeHeight/2, shapeWidth/2, shapeHeight/2);
      pop();
      pop();
    } else if (shapeType == "lineWeight") {
      push();                                        // shift for border 
       offscreen.translate(borderSpace, borderSpace);
      push();
       offscreen.translate( x, y );      
       offscreen.stroke(r, g, b, alphaValue);
       offscreen.strokeWeight(int(abs(256-alphaValue)/int(maxShapeWidth/10)));
       offscreen.line(-shapeWidth/2, -shapeHeight/2, shapeWidth/2, shapeHeight/2);
      pop();
      pop();
    } else if (shapeType == "lineWeightRotate") {
      push();                                        // shift for border 
       offscreen.translate(borderSpace, borderSpace);
      push();
       offscreen.translate( x, y );      
       offscreen.stroke(r, g, b, alphaValue);
       offscreen.strokeWeight(int(abs(256-alphaValue)/int(maxShapeWidth/10)));
       offscreen.rotate(random(2*PI));
       offscreen.line(-shapeWidth/2, -shapeHeight/2, shapeWidth/2, shapeHeight/2);
      pop();
      pop();
    } else if (shapeType == "rect") {
      push();                                        // shift for border 
       offscreen.translate(borderSpace, borderSpace);
      push();
       rectMode(CENTER);
       offscreen.translate( x, y );      
       offscreen.fill(r, g, b, alphaValue);
       offscreen.rect(0, 0, shapeWidth, shapeHeight);
      pop();
      pop();
    } else if (shapeType == "rectRotate") {
      push();                                        // shift for border 
       offscreen.translate(borderSpace, borderSpace);
      push();
      rectMode(CENTER);
       offscreen.translate( x, y );      
       offscreen.fill(r, g, b, alphaValue);
       offscreen.rotate(random(2*PI));
       offscreen.rect(0, 0, shapeWidth, shapeHeight);
      pop();
      pop();
    } else if (shapeType == "triangle") {
      push();                                        // shift for border 
       offscreen.translate(borderSpace, borderSpace);
      push();
       offscreen.translate( x, y );      
       offscreen.fill(r, g, b, alphaValue);
       offscreen.triangle(- shapeWidth/2, shapeHeight/2, 
        0, -shapeHeight/2, 
        shapeWidth/2, shapeHeight/2);
      pop();
      pop();
    } else if (shapeType == "triangleRotate") {
      push();                                        // shift for border 
       offscreen.translate(borderSpace, borderSpace);
      push();
       offscreen.translate( x, y );      
       offscreen.fill(r, g, b, alphaValue);
       offscreen.rotate(random(2*PI));
       offscreen.triangle(- shapeWidth/2, shapeHeight/2, 
        0, -shapeHeight/2, 
        shapeWidth/2, shapeHeight/2);  
      pop();
      pop();
    } else if (shapeType == "square") {
      push();                                        // shift for border 
       offscreen.translate(borderSpace, borderSpace);
      push();
       offscreen.rectMode(CENTER);
       offscreen.translate( x, y );      
       offscreen.fill(r, g, b, alphaValue);
       offscreen.rect(0, 0, min(shapeWidth, shapeHeight), min(shapeWidth, shapeHeight));
      pop();
      pop();
    } else if (shapeType == "squareRotate") {
      push();                                        // shift for border 
       offscreen.translate(borderSpace, borderSpace);
      push();
       offscreen.rectMode(CENTER);
       offscreen.translate( x, y );    
       offscreen.rotate(random(2*PI));
       offscreen.fill(r, g, b, alphaValue);
       offscreen.rect(0, 0, min(shapeWidth, shapeHeight), min(shapeWidth, shapeHeight));
      pop();
      pop();
    } else if (shapeType == "word") {
      push();
       offscreen.translate( x, y );    
       offscreen.fill(r, g, b, alphaValue);
       offscreen.text(wordArray[round(random(-0.49, wordArray.length -1 + 0.49))], 0, 0);
      pop();
    }
    
    offscreen.endDraw();
    
  }
}
