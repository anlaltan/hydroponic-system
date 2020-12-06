#include <AFMotor.h>
AF_DCMotor motor1(1);
AF_DCMotor motor2(2);
AF_DCMotor motor3(3);
#define led 13

void setup(){
Serial.begin(9600);
pinMode(led, OUTPUT);
motor1.setSpeed(200);
motor1.run(RELEASE);
motor2.run(RELEASE);
}

void loop(){
  uint8_t i;
  
  if(Serial.available() > 0){
    String data = Serial.readStringUntil('\n');
    Serial.print("you sent me: ");
    Serial.println(data);
    if(data == "ph_down"){
      motor1.run(FORWARD);
      motor1.setSpeed(255);
      delay(2000);
      motor1.run(RELEASE);
    }
    if(data == "ph_up"){
      motor2.run(FORWARD);
      motor2.setSpeed(255);
      delay(2000);
      motor2.run(RELEASE);
    }
    if(data == "led_turn_off"){
      digitalWrite(led, LOW);
  }
}
