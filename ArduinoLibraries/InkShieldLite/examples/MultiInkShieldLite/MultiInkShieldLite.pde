/*
 *  MultiInkShieldLite.pde - Multiple InkShields sketch (for Arduino and Arduino Mega)
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