/*
 *  MinimalInkShield.pde - Basic InkShield sketch
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

#include <InkShield.h>

//initialize shield on pin 2
InkShieldA0A3 MyInkShield(2);
//For shields set to A2A5 use InkShieldA2A5 to initialize instead of InkShieldA0A3
//InkShieldA2A5 MyInkShield(2);

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