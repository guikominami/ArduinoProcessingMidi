import processing.serial.*; //importing serial library 
float inByte; //to store incomming value from serial port
float reading=0; //to store mapped inByte value

Serial arduino; //naming our serial port as "arduino"

void setup() //only runs one time when program starts
{
  size(640, 360);
  background(255);  
  print(Serial.list()[0]);
  arduino = new Serial(this, Serial.list()[0], 9600); //initializing port, in my case arduino is no.4 in the list  
}

void draw() //this will loop by 60 frame per second by default , frame rate can be changed by frameRate() function
{
  if (arduino.available()>0) //checking whether there is incomming serial values
  {
    inByte=arduino.read(); //storing incomming values to variable inByte
  } 
  else
  {
    reading=0; //if no values are comming from our port reading will be zero
  }
  reading=map(inByte, 0, 255, 0, 4.72); //maping and storing the inByte value from 0 to 255 to 0 to 4.72, watch the video to find how i got the value 4.72
  println(inByte);//printing inByte value , only for debuging purpose, we can command this line 
}
