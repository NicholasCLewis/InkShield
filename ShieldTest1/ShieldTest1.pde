/*
 *  ShieldTest1.pde - Basic InkShield Test sketch (for Arduino and Arduino Mega)
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

//initialize shield on pin 2
const byte pulsePin = 2;

void setup() {
  setABCDPinMode(abcdA0A3, OUTPUT);  //set the abcd pins as outputs
  pinMode(pulsePin, OUTPUT);         //set the pulse pin as output
}

void loop() {
  //spray all 12 nozzles as fast as possible
  //(blackout pattern 0x0FFF = 0000111111111111)
  for(int i=1;i<12;i++){
    spray_ink(0x0FFF);
  }
  //(every other nozzle 0x0AAA = 0000101010101010)
  for(int i=1;i<12;i++){
    spray_ink(0x0AAA);
  }
  //(every other nozzle 0x0555 = 0000010101010101)
  for(int i=1;i<12;i++){
    spray_ink(0x0555);
  }

}

void spray_ink(word strip)
{
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
      fastABCDDigitalWrite(abcdA0A3, i, HIGH);  //set abcd (nozzle address)
      fastDigitalWrite(pulsePin, HIGH); delayMicroseconds(5);  //pulse pin high, wait 5us
      fastDigitalWrite(pulsePin, LOW); //pulse pin low
      fastABCDDigitalWrite(abcdA0A3, i, LOW); //reset abcd
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
