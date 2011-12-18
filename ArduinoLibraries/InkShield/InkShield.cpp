/*
 *  InkShield.cpp - Library for InkShield
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

//******************************************************************************
//* Includes
//******************************************************************************

#include "InkShield.h"

//******************************************************************************
//* Constructors
//******************************************************************************
InkShieldA0A3::InkShieldA0A3(byte pulse)
{
  // initialize the digital pins as output.
  _num_shields = 1;
  _pulse = (byte *)malloc(sizeof(pulse));
  pinMode(abcd0, OUTPUT);
  pinMode(abcd0+1, OUTPUT);
  pinMode(abcd0+2, OUTPUT);
  pinMode(abcd0+3, OUTPUT);
  _pulse[0]=pulse;
  _pulsePins[pulse]=true;
  pinMode(pulse, OUTPUT);
}

InkShieldA0A3::InkShieldA0A3(byte pulse[])
{
  // initialize the digital pins as output.
  _num_shields = sizeof(pulse);
  _pulse = (byte *)malloc(sizeof(pulse));
  pinMode(abcd0, OUTPUT);
  pinMode(abcd0+1, OUTPUT);
  pinMode(abcd0+2, OUTPUT);
  pinMode(abcd0+3, OUTPUT);
  for(byte i=0;i<_num_shields;i++){
    _pulse[i]=pulse[i];
    _pulsePins[pulse[i]]=true;
    pinMode(pulse[i], OUTPUT);
  }
}

InkShieldA2A5::InkShieldA2A5(byte pulse)
{
  // initialize the digital pins as output.
  _num_shields = 1;
  _pulse = (byte *)malloc(sizeof(pulse));
  pinMode(abcd1, OUTPUT);
  pinMode(abcd1+1, OUTPUT);
  pinMode(abcd1+2, OUTPUT);
  pinMode(abcd1+3, OUTPUT);
  _pulse[0]=pulse;
  _pulsePins[pulse]=true;
  pinMode(pulse, OUTPUT);
}

InkShieldA2A5::InkShieldA2A5(byte pulse[])
{
  // initialize the digital pins as output.
  _num_shields = sizeof(pulse);
  _pulse = (byte *)malloc(sizeof(pulse));
  pinMode(abcd1, OUTPUT);
  pinMode(abcd1+1, OUTPUT);
  pinMode(abcd1+2, OUTPUT);
  pinMode(abcd1+3, OUTPUT);
  for(byte i=0;i<_num_shields;i++){
    _pulse[i]=pulse[i];
    _pulsePins[pulse[i]]=true;
    pinMode(pulse[i], OUTPUT);
  }
}

//******************************************************************************
//* Public Methods
//******************************************************************************


void InkShieldA0A3::spray_ink(word strip) //Sprays ink on the first pulse pin defined
{
  switch(_pulse[0]){
    case 2:
      spray_ink2(strip);
      break;
    case 3:
      spray_ink3(strip);
      break;
    case 4:
      spray_ink4(strip);
      break;
    case 5:
      spray_ink5(strip);
      break;
    case 6:
      spray_ink6(strip);
      break;
    case 7:
      spray_ink7(strip);
      break;
    case 8:
      spray_ink8(strip);
      break;
    case 9:
      spray_ink9(strip);
      break;
    case 10:
      spray_ink10(strip); 
      break;
    case 11:
      spray_ink11(strip);
      break;
    case 12:
      spray_ink12(strip);
  }
}


void InkShieldA0A3::spray_ink2(word strip)
{
if(_pulsePins[2]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd0, i, HIGH); 
	  fastDigitalWrite(2, HIGH); delayMicroseconds(5);
    fastDigitalWrite(2, LOW); 
	  fastABCDDigitalWrite(abcd0, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA0A3::spray_ink3(word strip)
{
if(_pulsePins[3]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd0, i, HIGH); 
	  fastDigitalWrite(3, HIGH); delayMicroseconds(5);
    fastDigitalWrite(3, LOW); 
	  fastABCDDigitalWrite(abcd0, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA0A3::spray_ink4(word strip)
{
if(_pulsePins[4]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd0, i, HIGH); 
	  fastDigitalWrite(4, HIGH); delayMicroseconds(5);
    fastDigitalWrite(4, LOW); 
	  fastABCDDigitalWrite(abcd0, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA0A3::spray_ink5(word strip)
{
if(_pulsePins[5]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd0, i, HIGH); 
	  fastDigitalWrite(5, HIGH); delayMicroseconds(5);
    fastDigitalWrite(5, LOW); 
	  fastABCDDigitalWrite(abcd0, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA0A3::spray_ink6(word strip)
{
if(_pulsePins[6]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd0, i, HIGH); 
	  fastDigitalWrite(6, HIGH); delayMicroseconds(5);
    fastDigitalWrite(6, LOW); 
	  fastABCDDigitalWrite(abcd0, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA0A3::spray_ink7(word strip)
{
if(_pulsePins[7]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd0, i, HIGH); 
	  fastDigitalWrite(7, HIGH); delayMicroseconds(5);
    fastDigitalWrite(7, LOW); 
	  fastABCDDigitalWrite(abcd0, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA0A3::spray_ink8(word strip)
{
if(_pulsePins[8]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd0, i, HIGH); 
	  fastDigitalWrite(8, HIGH); delayMicroseconds(5);
    fastDigitalWrite(8, LOW); 
	  fastABCDDigitalWrite(abcd0, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA0A3::spray_ink9(word strip)
{
if(_pulsePins[9]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd0, i, HIGH); 
	  fastDigitalWrite(9, HIGH); delayMicroseconds(5);
    fastDigitalWrite(9, LOW); 
	  fastABCDDigitalWrite(abcd0, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA0A3::spray_ink10(word strip)
{
if(_pulsePins[10]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd0, i, HIGH); 
	  fastDigitalWrite(10, HIGH); delayMicroseconds(5);
    fastDigitalWrite(10, LOW); 
	  fastABCDDigitalWrite(abcd0, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA0A3::spray_ink11(word strip)
{
if(_pulsePins[11]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd0, i, HIGH); 
	  fastDigitalWrite(11, HIGH); delayMicroseconds(5);
    fastDigitalWrite(11, LOW); 
	  fastABCDDigitalWrite(abcd0, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA0A3::spray_ink12(word strip)
{
if(_pulsePins[12]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd0, i, HIGH); 
	  fastDigitalWrite(12, HIGH); delayMicroseconds(5);
    fastDigitalWrite(12, LOW); 
	  fastABCDDigitalWrite(abcd0, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}


void InkShieldA2A5::spray_ink(word strip) //Sprays ink on the first pulse pin defined
{
  switch(_pulse[0]){
    case 2:
      spray_ink2(strip);
      break;
    case 3:
      spray_ink3(strip);
      break;
    case 4:
      spray_ink4(strip);
      break;
    case 5:
      spray_ink5(strip);
      break;
    case 6:
      spray_ink6(strip);
      break;
    case 7:
      spray_ink7(strip);
      break;
    case 8:
      spray_ink8(strip);
      break;
    case 9:
      spray_ink9(strip);
      break;
    case 10:
      spray_ink10(strip); 
      break;
    case 11:
      spray_ink11(strip);
      break;
    case 12:
      spray_ink12(strip);
  }
}


void InkShieldA2A5::spray_ink2(word strip)
{
if(_pulsePins[2]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd1, i, HIGH); 
	  fastDigitalWrite(2, HIGH); delayMicroseconds(5);
    fastDigitalWrite(2, LOW); 
	  fastABCDDigitalWrite(abcd1, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA2A5::spray_ink3(word strip)
{
if(_pulsePins[3]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd1, i, HIGH); 
	  fastDigitalWrite(3, HIGH); delayMicroseconds(5);
    fastDigitalWrite(3, LOW); 
	  fastABCDDigitalWrite(abcd1, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA2A5::spray_ink4(word strip)
{
if(_pulsePins[4]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd1, i, HIGH); 
	  fastDigitalWrite(4, HIGH); delayMicroseconds(5);
    fastDigitalWrite(4, LOW); 
	  fastABCDDigitalWrite(abcd1, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA2A5::spray_ink5(word strip)
{
if(_pulsePins[5]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd1, i, HIGH); 
	  fastDigitalWrite(5, HIGH); delayMicroseconds(5);
    fastDigitalWrite(5, LOW); 
	  fastABCDDigitalWrite(abcd1, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA2A5::spray_ink6(word strip)
{
if(_pulsePins[6]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd1, i, HIGH); 
	  fastDigitalWrite(6, HIGH); delayMicroseconds(5);
    fastDigitalWrite(6, LOW); 
	  fastABCDDigitalWrite(abcd1, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA2A5::spray_ink7(word strip)
{
if(_pulsePins[7]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd1, i, HIGH); 
	  fastDigitalWrite(7, HIGH); delayMicroseconds(5);
    fastDigitalWrite(7, LOW); 
	  fastABCDDigitalWrite(abcd1, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA2A5::spray_ink8(word strip)
{
if(_pulsePins[8]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd1, i, HIGH); 
	  fastDigitalWrite(8, HIGH); delayMicroseconds(5);
    fastDigitalWrite(8, LOW); 
	  fastABCDDigitalWrite(abcd1, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA2A5::spray_ink9(word strip)
{
if(_pulsePins[9]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd1, i, HIGH); 
	  fastDigitalWrite(9, HIGH); delayMicroseconds(5);
    fastDigitalWrite(9, LOW); 
	  fastABCDDigitalWrite(abcd1, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA2A5::spray_ink10(word strip)
{
if(_pulsePins[10]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd1, i, HIGH); 
	  fastDigitalWrite(10, HIGH); delayMicroseconds(5);
    fastDigitalWrite(10, LOW); 
	  fastABCDDigitalWrite(abcd1, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA2A5::spray_ink11(word strip)
{
if(_pulsePins[11]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd1, i, HIGH); 
	  fastDigitalWrite(11, HIGH); delayMicroseconds(5);
    fastDigitalWrite(11, LOW); 
	  fastABCDDigitalWrite(abcd1, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}

void InkShieldA2A5::spray_ink12(word strip)
{
if(_pulsePins[12]==true){
  //loop thru the strip
  for(byte i = 0; i <= 11; i++){
    if(strip & 1<<i){
	  fastABCDDigitalWrite(abcd1, i, HIGH); 
	  fastDigitalWrite(12, HIGH); delayMicroseconds(5);
    fastDigitalWrite(12, LOW); 
	  fastABCDDigitalWrite(abcd1, i, LOW);
    }
  }	
  //wait to be sure we don't try to fire nozzles too fast and burn them out
  delayMicroseconds(800);
}
}
