/*
 *  MultiInkShield.pde - Multiple InkShields sketch
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

#include <InkShield.h>

//initialize shields on pins 2 & 3
//(this currently does not work for more than two shields - NEED TO FIX)
byte pins[]={2,3};
InkShieldA0A3 MyInkShield(pins);
//For shields set to A2A5 use InkShieldA2A5 to initialize instead of InkShieldA0A3
//InkShieldA2A5 MyInkShield(pins);

void setup() {
  //nothing to setup
}

void loop() {
  //spray all 12 nozzles as fast as possible (blackout pattern)
  //with multiple shields this call will spray ink from the first shield (on pin 2 in this case)
  MyInkShield.spray_ink(0x0FFF); //first shield (on pin 2)
  //these calls will always work for single or multi shields (and will only spray ink if that pin was init above)
  MyInkShield.spray_ink3(0x0FFF); //shield on pin 3
}