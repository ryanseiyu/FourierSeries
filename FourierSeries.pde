/**
 * Fourier Series 
 * by Ryan Seiyu.  
 * 
 * Demonstration of the Fourier Series by The Coding Train Youtube Channel using Java.
 * 
 */

float time = 0;
ArrayList<Float> wave; //ArrayList declaration.



void setup() {
  size(600,400);
  wave = new ArrayList<Float>(); //Object creation with Float parameter.
}

void draw() {
  background(0);
  translate(150,200);
  float a = 0;
  float b = 0;
  
  //Creation of Cos and Sin waves as functions of time.
  for (int i = 0 ; i < 200 ; i++){
    float preva = a;
    float prevb = b;
    int n = i * 2 + 1;
    float radius = 100 * (4 / (n * PI));
    a += radius * cos(n * time);
    b += radius * sin(n * time);   
    stroke (255);
    noFill();
    ellipse(preva , prevb , radius*2 , radius*2);
    stroke(255);
    line(preva , prevb , a , b);
  }
  
  translate(200,0);
  
  wave.add(b); //Adding element b = radius * cos(n * time);
  line(a - 200 , b ,0 , wave.get(0)); //Line connecting to the tiniest circle of the Fourier Series.
  
  //Drawing of the Fourier Series.
  beginShape(); 
  noFill();
  for(int z = 0 ; z < wave.size() ; z++){
    vertex(z , wave.get(z));
  }
  endShape();
  
  time += 0.05;
  
  //Reseting the Fourier Series drawing.
  if (wave.size()>250){
    wave.clear();
  }  
}
