
import creativecoding.tact.*;
import processing.serial.*;  
import processing.sound.*; /// For SimplePlayBack
Tact tact;
TactSensor sensor;
SoundFile soundfile;
PImage img;
PShape skull;
float ry;

void setup() {
  size(1366,768);
  
  // Create new Tact wrapper
  // listen on serial port 0
  tact = new Tact(this, 0);
  
  // Create a Tact sensor and monitor
  // incoming values at sensor pin 0
  sensor = tact.addSensor(0);
  
  // Start frequent updates
  tact.startUpdates();
  soundfile = new SoundFile(this, "Spooky.mp3");
  soundfile.loop();
  img = loadImage("skull.jpg");
  }

void draw() {
  // Clear background
  background(0);
  lights();
  
  // Define diameter based on sensor peak
  float size = sensor.peak() * min(width, height);
  float soundAmpi = sensor.peak() * min(width, height);
  float soundRate = sensor.bias()* min(width,height);
  //int peakValue= (int) (sensor.peak());
  
  // Draw ellipse in center of the sketch
  //ellipse (width/2, height/2, size, size);
  float amplitude = map(soundAmpi, 0, width, 0.2, 1.0);
  soundfile.amp(amplitude);
  float playbackSpeed = map(soundRate, 0, width, 0.2, 2.0);
  soundfile.rate(playbackSpeed);
  
  
  
  image(img, width/3, height/3, size, size);
  
    //textSize(32);
    //text("You can touch me", width/3, height/3+300);
    //fill(255,0,0,80);
    
    //if(peakValue>= 200){
    //textSize(32);
    //text("You can Grab me", width/3, height/3+300);
    //fill(255,0,0,80);
    //}
    //else if(330<=peakValue>>530){
    //textSize(32);
    //text("leave me alone", width/3, height/3+300);
    //fill(255,0,0,80);
    
    //}
    //Serial.println(sensor.peak);
    
}
