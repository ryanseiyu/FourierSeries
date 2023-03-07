class Slider {
  String slider_name;
  float posx, posy;
  float min;
  float max;
  float value;
  
  float blockx;
  int block_size = 20;
  float slider_length = 200;
  
  boolean over = false;
  boolean locked = false;
  
  public Slider(String slider_name_, float posx_, float posy_, float min_, float max_, float value_){
    slider_name = slider_name_;
    posx = posx_;
    posy = posy_;
    min = min_;
    max = max_;
    value = value_;
    blockx = posx+slider_length*(value/(max-min));
    
    // draw Slider
    getText();
    line (posx, posy, posx+slider_length, posy);
    ellipse(blockx,posy,block_size,block_size);
  }

  public void drawSlider() {
    getText();
    line (posx, posy, posx+slider_length, posy);
    if (dist(mouseX, mouseY, blockx, posy) < block_size) {
      fill(100);
      over = true;
    }
    else {
      fill(100);
      over = false;
    }

    if (blockx < posx) {
      blockx = posx;
      value = min;
    }

    if (blockx > posx+slider_length) {
      blockx = posx+slider_length;
      value = max;
    }
    
    ellipse(blockx,posy,block_size,block_size);
  }
  
  float updateValue() {
    value = (blockx-posx)/slider_length * (max-min) + min;
    value = (float)(Math.round(value*100))/100;
    return value;
  }
  
  void getText() {
    fill(255);
    textAlign(LEFT, TOP);
    text(slider_name+":"+str(value),posx,posy-block_size);
    textAlign(LEFT, TOP);
    text(str(min),posx,posy+block_size+5);
    textAlign(RIGHT, TOP);
    text(str(max),posx+slider_length,posy+block_size);
  }
  
  void mousePressed() {
    if (over) {
      locked = true;
    }
  }
  
  void mouseDragged() {
    if (locked) {
      blockx = mouseX;
      value = updateValue();
    }
  }
  
  void mouseReleased() {
    locked = false;
  }
}
