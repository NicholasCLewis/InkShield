/*
 *  MinimalInkShieldLite.pde - Basic InkShield sketch (for Arduino and Arduino Mega)
 *  Copyright 2011, Nicholas C Lewis, GNU Lesser General Public License
 *  http://nicholasclewis.com/inkshield/
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2.1 of the License, or (at your option) any later version.
 *  http://www.gnu.org/licenses/lgpl-2.1.html
 * 
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 * 
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
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
  spray_ink(0x0FFF);
  //or other patterns
  //(every other nozzle 0x0AAA = 0000101010101010)
  //spray_ink(0x0AAA);
  //(every other nozzle 0x0555 = 0000010101010101)
  //spray_ink(0x0555);
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