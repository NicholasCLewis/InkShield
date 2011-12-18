/*
 *  InkShield.h - Library for InkShield
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

#ifndef InkShield_h
#define InkShield_h

#if defined(ARDUINO) && ARDUINO >= 100
#include "Arduino.h"
#else
#include "WProgram.h"
#endif

class InkShieldA0A3
{
  public:
	InkShieldA0A3(byte pulse);
  InkShieldA0A3(byte pulse[]);
  void spray_ink(word strip);
  void spray_ink2(word strip);
	void spray_ink3(word strip);
	void spray_ink4(word strip);
	void spray_ink5(word strip);
	void spray_ink6(word strip);
	void spray_ink7(word strip);
	void spray_ink8(word strip);
	void spray_ink9(word strip);
	void spray_ink10(word strip);
	void spray_ink11(word strip);
	void spray_ink12(word strip);
  
  private:
	//pin numbers:
  byte *_pulse;
	boolean _pulsePins[12];
	byte _num_shields;
};

class InkShieldA2A5
{
  public:
	InkShieldA2A5(byte pulse);
  InkShieldA2A5(byte pulse[]);
  void spray_ink(word strip);
  void spray_ink2(word strip);
	void spray_ink3(word strip);
	void spray_ink4(word strip);
	void spray_ink5(word strip);
	void spray_ink6(word strip);
	void spray_ink7(word strip);
	void spray_ink8(word strip);
	void spray_ink9(word strip);
	void spray_ink10(word strip);
	void spray_ink11(word strip);
	void spray_ink12(word strip);
  
  private:
	//pin numbers:
  byte *_pulse;
	boolean _pulsePins[12];
	byte _num_shields;
};

#include <avr/io.h>

//------------------------------------------------------------------------------
/** struct for mapping digital pins */
struct pin_map_t {
  volatile uint8_t* ddr;
  volatile uint8_t* pin;
  volatile uint8_t* port;
  uint8_t bit;
};

//------------------------------------------------------------------------------
#if defined(__AVR_ATmega168__) || defined(__AVR_ATmega328P__)
// 168 and 328 Arduinos

// Two Wire (aka I2C) ports
uint8_t const SDA_PIN = 18;
uint8_t const SCL_PIN = 19;

// SPI port
uint8_t const SS_PIN = 10;
uint8_t const MOSI_PIN = 11;
uint8_t const MISO_PIN = 12;
uint8_t const SCK_PIN = 13;

static const pin_map_t digitalPinMap[] = {
  {&DDRD, &PIND, &PORTD, 0},  // D0  0
  {&DDRD, &PIND, &PORTD, 1},  // D1  1
  {&DDRD, &PIND, &PORTD, 2},  // D2  2
  {&DDRD, &PIND, &PORTD, 3},  // D3  3
  {&DDRD, &PIND, &PORTD, 4},  // D4  4
  {&DDRD, &PIND, &PORTD, 5},  // D5  5
  {&DDRD, &PIND, &PORTD, 6},  // D6  6
  {&DDRD, &PIND, &PORTD, 7},  // D7  7
  {&DDRB, &PINB, &PORTB, 0},  // B0  8
  {&DDRB, &PINB, &PORTB, 1},  // B1  9
  {&DDRB, &PINB, &PORTB, 2},  // B2 10
  {&DDRB, &PINB, &PORTB, 3},  // B3 11
  {&DDRB, &PINB, &PORTB, 4},  // B4 12
  {&DDRB, &PINB, &PORTB, 5},  // B5 13
  {&DDRC, &PINC, &PORTC, 0},  // C0 14
  {&DDRC, &PINC, &PORTC, 1},  // C1 15
  {&DDRC, &PINC, &PORTC, 2},  // C2 16
  {&DDRC, &PINC, &PORTC, 3},  // C3 17
  {&DDRC, &PINC, &PORTC, 4},  // C4 18
  {&DDRC, &PINC, &PORTC, 5}   // C5 19
};

uint8_t const abcd0= 14;  // A0-A3
uint8_t const abcd1= 16;  // A2-A5

#else
  #error This library only supports Arduino boards with ATmega168 or ATmega328
#endif  // defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
//------------------------------------------------------------------------------
static const uint8_t digitalPinCount = sizeof(digitalPinMap)/sizeof(pin_map_t);

uint8_t badPinNumber(void)
  __attribute__((error("Pin number is too large or not a constant")));

static inline __attribute__((always_inline))
  uint8_t getPinMode(uint8_t pin) {
  if (__builtin_constant_p(pin) && pin < digitalPinCount) {
    return (*digitalPinMap[pin].ddr >> digitalPinMap[pin].bit) & 1;
  } else {
    return badPinNumber();
  }
}
static inline __attribute__((always_inline))
  void setPinMode(uint8_t pin, uint8_t mode) {
  if (__builtin_constant_p(pin) && pin < digitalPinCount) {
    if (mode) {
      *digitalPinMap[pin].ddr |= 1 << digitalPinMap[pin].bit;
    } else {
      *digitalPinMap[pin].ddr &= ~(1 << digitalPinMap[pin].bit);
    }
  } else {
    badPinNumber();
  }
}

static inline __attribute__((always_inline))
  void setABCDPinMode(uint8_t abcd, uint8_t mode) {
  if (__builtin_constant_p(abcd) && abcd < digitalPinCount) {
    if (mode) {
      *digitalPinMap[abcd].ddr |= B1111 << digitalPinMap[abcd].bit;
    } else {
      *digitalPinMap[abcd].ddr &= ~(B1111 << digitalPinMap[abcd].bit);
    }
  } else {
    badPinNumber();
  }
}
static inline __attribute__((always_inline))
  uint8_t fastDigitalRead(uint8_t pin) {
  if (__builtin_constant_p(pin) && pin < digitalPinCount) {
    return (*digitalPinMap[pin].pin >> digitalPinMap[pin].bit) & 1;
  } else {
    return badPinNumber();
  }
}
static inline __attribute__((always_inline))
  void fastDigitalWrite(uint8_t pin, uint8_t value) {
  if (__builtin_constant_p(pin) && pin < digitalPinCount) {
    if (value) {
      *digitalPinMap[pin].port |= 1 << digitalPinMap[pin].bit;
    } else {
      *digitalPinMap[pin].port &= ~(1 << digitalPinMap[pin].bit);
    }
  } else {
    badPinNumber();
  }
}
static inline __attribute__((always_inline))
  void fastABCDDigitalWrite(uint8_t abcd, uint8_t nozzle, uint8_t value) {
  if (__builtin_constant_p(abcd) && abcd < digitalPinCount && nozzle <= 16) {
    if (value) {
      *digitalPinMap[abcd].port |= nozzle << digitalPinMap[abcd].bit;
    } else {
      *digitalPinMap[abcd].port &= ~(nozzle << digitalPinMap[abcd].bit);
    }
  } else {
    badPinNumber();
  }
}

#endif
