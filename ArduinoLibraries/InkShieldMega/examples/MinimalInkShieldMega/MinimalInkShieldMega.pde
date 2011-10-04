/*
 *  MinimalInkShieldMega.pde - Basic InkShield sketch (for Mega)
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

#include <InkShieldMega.h>

//initialize shield on pin 2 (valid options are 2-12 or 26-29)
InkShieldA0A3 MyInkShield(2);
//For shields set to A2-A5 use InkShieldA2A5 to initialize instead of InkShieldA0A3
//InkShieldA2A5 MyInkShield(2);
//For shields set to 22-25 use InkShield2225 to initialize instead of InkShieldA0A3
//InkShield2225 MyInkShield(2);

void setup() {
//nothing to setup
}

void loop() {
  //spray all 12 nozzles as fast as possible
  //(blackout pattern 0x0FFF = 0000111111111111)
  MyInkShield.spray_ink(0x0FFF);
  
  //or other patterns
  //(every other nozzle 0x0AAA = 0000101010101010)
  //MyInkShield.spray_ink(0x0AAA);
  //(every other nozzle 0x0555 = 0000010101010101)
  //MyInkShield.spray_ink(0x0555);
}