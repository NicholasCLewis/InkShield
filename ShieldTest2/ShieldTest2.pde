/*
 *  ShieldTest2.pde - Multiple InkShields Test sketch (for Arduino and Arduino Mega)
 *  Nov 21, 2011, Nicholas C Lewis, Creative Commons Attribution-ShareAlike 3.0
 *  http://nicholasclewis.com/inkshield/
 *
 ***********************************************************************************
 *  Designed to check all the pulse pins by sending a different ABCD to each Pulse *
 *  This way you can hook one shield up and move the jumper down from 2 to 12      *
 *  and see that each one works                                                    *
 ***********************************************************************************
 *
 *  This is free software. You can redistribute it and/or modify it under
 *  the terms of Creative Commons Attribution-ShareAlike 3.0 United States License.
 *  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/ 
 *  or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.'
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING 
 *  BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
 *  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 *  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
 
//this library will work with both Arduino and Arduino Mega
#include <InkShieldLite.h>

//initialize shields on pins 2 & 3, abcd = A0A3
const byte pulsePin[]={2,3,4,5,6,7,8,9,10,11,12};
const byte abcd=abcdA2A5;

void setup() {
  setABCDPinMode(abcd, OUTPUT);  //set the abcd pins as outputs
  pinMode(pulsePin[0], OUTPUT);         //set the pulse pin as output
  pinMode(pulsePin[1], OUTPUT);         //set the pulse pin as output
  pinMode(pulsePin[2], OUTPUT);         //set the pulse pin as output
  pinMode(pulsePin[3], OUTPUT);         //set the pulse pin as output
  pinMode(pulsePin[4], OUTPUT);         //set the pulse pin as output
  pinMode(pulsePin[5], OUTPUT);         //set the pulse pin as output
  pinMode(pulsePin[6], OUTPUT);         //set the pulse pin as output
  pinMode(pulsePin[7], OUTPUT);         //set the pulse pin as output
  pinMode(pulsePin[8], OUTPUT);         //set the pulse pin as output
  pinMode(pulsePin[9], OUTPUT);         //set the pulse pin as output
  pinMode(pulsePin[10], OUTPUT);         //set the pulse pin as output
}


void loop() {
      fastABCDDigitalWrite(abcd, 0, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[0], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[0], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, 0, LOW); //reset abcd
      
      fastABCDDigitalWrite(abcd, 1, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[1], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[1], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, 1, LOW); //reset abcd
      
      fastABCDDigitalWrite(abcd, 2, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[2], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[2], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, 2, LOW); //reset abcd
      
      fastABCDDigitalWrite(abcd, 3, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[3], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[3], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, 3, LOW); //reset abcd
      
      fastABCDDigitalWrite(abcd, 4, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[4], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[4], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, 4, LOW); //reset abcd
      
      fastABCDDigitalWrite(abcd, 5, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[5], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[5], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, 5, LOW); //reset abcd
      
      fastABCDDigitalWrite(abcd, 6, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[6], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[6], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, 6, LOW); //reset abcd
      
      fastABCDDigitalWrite(abcd, 7, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[7], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[7], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, 7, LOW); //reset abcd
      
      fastABCDDigitalWrite(abcd, 8, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[8], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[8], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, 8, LOW); //reset abcd
      
      fastABCDDigitalWrite(abcd, 9, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[9], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[9], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, 9, LOW); //reset abcd
      
      fastABCDDigitalWrite(abcd, 10, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[10], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[10], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, 10, LOW); //reset abcd
      //wait to be sure we don't try to fire nozzles too fast and burn them out
      delayMicroseconds(800);
}
