/*
 *  MultiInkShieldLite.pde - Multiple InkShields sketch (for Arduino and Arduino Mega)
 *  Oct 1, 2011, Nicholas C Lewis, Creative Commons Attribution-ShareAlike 3.0
 *  http://nicholasclewis.com/inkshield/
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
const byte pulsePin[]={2,3};
const byte abcd=abcdA0A3;

void setup() {
  setABCDPinMode(abcd, OUTPUT);  //set the abcd pins as outputs
  pinMode(pulsePin[0], OUTPUT);         //set the pulse pin as output
  pinMode(pulsePin[1], OUTPUT);         //set the pulse pin as output
}

void loop() {
  //spray all 12 nozzles as fast as possible (blackout pattern)
  spray_ink0(0x0FFF); //first shield (on pin 2)
  spray_ink1(0x0FFF); //shield on pin 3
}

//the fastDigitalWrite requires that the input be a const
//so you must have one of these for each pulse pin (shield)
void spray_ink0(word strip)
{
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
      fastABCDDigitalWrite(abcd, i, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[0], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[0], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, i, LOW); //reset abcd
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}

//the fastDigitalWrite requires that the input be a const
//so you must have one of these for each pulse pin (shield)
void spray_ink1(word strip)
{
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
      fastABCDDigitalWrite(abcd, i, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin[1], HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin[1], LOW); //pulse pin low
      fastABCDDigitalWrite(abcd, i, LOW); //reset abcd
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}