EESchema Schematic File Version 2  date 12/1/2011 9:01:38 PM
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:arduino_shieldsNCL
LIBS:ATmega8
LIBS:atmega16
LIBS:connNCL
LIBS:SDadapter
LIBS:specialNCL
LIBS:AuxOutSingle-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
Sheet 1 1
Title "InkShield"
Date "2 dec 2011"
Rev "1.0"
Comp "Nicholas C Lewis"
Comment1 "CC BY-SA 3.0"
Comment2 "www.NicholasCLewis.com/InkShield"
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ 4150 3700
NoConn ~ 4250 3700
NoConn ~ 4250 4500
NoConn ~ 4150 4500
Wire Wire Line
	6200 3100 3750 3100
Wire Wire Line
	6200 3100 6200 2900
Wire Wire Line
	6100 5100 3750 5100
Wire Wire Line
	3250 3600 3250 4700
Wire Wire Line
	4050 4500 4050 4800
Wire Wire Line
	3950 3700 3950 3500
Wire Wire Line
	3950 3500 6600 3500
Wire Wire Line
	3750 3100 3750 3700
Wire Wire Line
	3650 3700 3650 3200
Wire Wire Line
	3650 3200 6000 3200
Wire Wire Line
	3550 4500 3550 5300
Wire Wire Line
	3450 3700 3450 3400
Wire Wire Line
	3450 3400 5600 3400
Wire Wire Line
	3450 4500 3450 5400
Connection ~ 5500 5400
Wire Wire Line
	5800 3300 3550 3300
Wire Wire Line
	6400 2900 6400 3000
Wire Wire Line
	6600 3500 6600 2900
Wire Wire Line
	5800 3300 5800 2900
Wire Wire Line
	5600 3400 5600 2900
Wire Wire Line
	6000 3200 6000 2900
Wire Wire Line
	5500 2900 5500 5400
Wire Wire Line
	5900 2900 5900 5200
Wire Wire Line
	5700 2900 5700 5300
Wire Wire Line
	6500 2900 6500 4900
Wire Wire Line
	6700 2900 6700 4800
Wire Wire Line
	5700 5300 3550 5300
Wire Wire Line
	6700 4800 4050 4800
Wire Wire Line
	3550 3300 3550 3700
Wire Wire Line
	5900 5200 3650 5200
Wire Wire Line
	3650 5200 3650 4500
Wire Wire Line
	6100 5100 6100 2900
Wire Wire Line
	3750 5100 3750 4500
Wire Wire Line
	6300 2900 6300 5000
Wire Wire Line
	3850 4500 3850 5000
Wire Wire Line
	6500 4900 3950 4900
Wire Wire Line
	3950 4900 3950 4500
Wire Wire Line
	4050 3700 4050 3600
Wire Wire Line
	4050 3600 3250 3600
Wire Wire Line
	3250 4700 3450 4700
Connection ~ 3450 4700
Wire Wire Line
	3850 3700 3850 3000
Wire Wire Line
	3450 5400 6800 5400
Wire Wire Line
	6800 5400 6800 2900
Wire Wire Line
	3850 5000 6300 5000
Wire Wire Line
	3850 3000 6400 3000
NoConn ~ 5300 2900
NoConn ~ 5400 2900
$Comp
L HP_Q2347A_FFC P1
U 1 1 4DDF0ACA
P 6100 2550
F 0 "P1" V 6060 2550 60  0000 C CNN
F 1 "HP_Q2347A_FFC" V 6180 2550 60  0000 C CNN
	1    6100 2550
	0    -1   -1   0   
$EndComp
$Comp
L CONN_9X2 P2
U 1 1 4DE2F960
P 3800 4100
F 0 "P2" H 3800 4550 60  0000 C CNN
F 1 "AUX_OUT" V 3800 4100 50  0000 C CNN
	1    3800 4100
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
