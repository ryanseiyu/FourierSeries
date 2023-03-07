/**
 * Fourier Series 
 * by Ryan Seiyu.  
 * 
 * Demonstration of the Fourier Series by The Coding Train Youtube Channel using Java.
 * 
 */

Slider s1;
float time = 0;
ArrayList<Float> wave;

void setup() {
  size(600,400);
  s1 = new Slider("A Value",50,20,1,100,50);
  wave = new ArrayList<Float>();
}  

void draw() {
  background(0);
  s1.drawSlider();
  translate(150,200);
  float a = 0;
  float b = 0;

  for (int i = 0 ; i < s1.value ; i++){
    float preva = a;
    float prevb = b;
    int n = i * 2 + 1;
    float radius = 100 * (4 / (n * PI));
    a += radius * cos(n * time);
    b += + radius * sin(n * time);   
    stroke (255);
    noFill();
    ellipse(preva , prevb , radius*2 , radius*2);
    stroke(255);
    line(preva , prevb , a , b);
  }
  
  translate(200,0);
  
  wave.add(b);
  line(a - 200 , b ,0 , wave.get(0));
  
  beginShape();
  noFill();
  for(int z = 0 ; z < wave.size() ; z++){
    vertex(z , wave.get(z));
  }
  endShape();
  
  time += 0.05;
  if (wave.size()>250){
    wave.clear();
  }  
}

void mousePressed() {
  s1.mousePressed();
}

void mouseDragged() {
  s1.mouseDragged();
}

void mouseReleased() {
  s1.mouseReleased();
}
