/*
 *  MultiInkShield.pde - Multiple InkShields sketch
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