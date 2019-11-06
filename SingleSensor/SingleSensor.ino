#include <Tact.h>
Tact Tact(TACT_SINGLE);

void setup() {
  // Start Tact toolkit with Serial
  // default baud rate: 115200
  Tact.beginSerial();
  Tact.addSensor(48,32,2);

  // you can define a custom baud rate like this:
  // Tact.beginSerial(9600);
}

void loop() {
  // used to receive tasks and send data via Serial
  // make sure to call this in every loop
  // do other stuff here
  Tact.readSerial();
  int peak = Tact.readPeak();  
  Serial.println(peak);
  Tact.readSerial();
  int bias = Tact.readBias();  
  Serial.println(bias);
}
