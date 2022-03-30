EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L V23105A5301A201:V23105A5301A201 K1
U 1 1 6240DF92
P 8400 2900
F 0 "K1" H 8400 3467 50  0000 C CNN
F 1 "V23105A5476A201" H 8400 3376 50  0000 C CNN
F 2 "RELAY_9-1393792-3" H 8400 2900 50  0001 L BNN
F 3 "" H 8400 2900 50  0001 L BNN
F 4 "1017" H 8400 2900 50  0001 L BNN "PARTREV"
F 5 "IPC-7351B" H 8400 2900 50  0001 L BNN "STANDARD"
F 6 "10.90mm" H 8400 2900 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 7 "9-1393792-3" H 8400 2900 50  0001 L BNN "COMMENT"
F 8 "TE Connectivity" H 8400 2900 50  0001 L BNN "MANUFACTURER"
	1    8400 2900
	1    0    0    -1  
$EndComp
$Comp
L V23105A5301A201:V23105A5301A201 K2
U 1 1 62411C9B
P 8400 4700
F 0 "K2" H 8400 5267 50  0000 C CNN
F 1 "V23105A5476A201" H 8400 5176 50  0000 C CNN
F 2 "RELAY_9-1393792-3" H 8400 4700 50  0001 L BNN
F 3 "" H 8400 4700 50  0001 L BNN
F 4 "1017" H 8400 4700 50  0001 L BNN "PARTREV"
F 5 "IPC-7351B" H 8400 4700 50  0001 L BNN "STANDARD"
F 6 "10.90mm" H 8400 4700 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 7 "9-1393792-3" H 8400 4700 50  0001 L BNN "COMMENT"
F 8 "TE Connectivity" H 8400 4700 50  0001 L BNN "MANUFACTURER"
	1    8400 4700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic_Shielded:Conn_01x01_Shielded J1
U 1 1 62413D4D
P 10250 1150
F 0 "J1" H 10338 1113 50  0000 L CNN
F 1 "Conn_01x01_Shielded" H 10338 1022 50  0000 L CNN
F 2 "" H 10250 1150 50  0001 C CNN
F 3 "~" H 10250 1150 50  0001 C CNN
	1    10250 1150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic_Shielded:Conn_01x01_Shielded J2
U 1 1 624142B6
P 10250 2200
F 0 "J2" H 10338 2163 50  0000 L CNN
F 1 "Conn_01x01_Shielded" H 10338 2072 50  0000 L CNN
F 2 "" H 10250 2200 50  0001 C CNN
F 3 "~" H 10250 2200 50  0001 C CNN
	1    10250 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic_Shielded:Conn_01x01_Shielded J3
U 1 1 62414BAE
P 10250 3200
F 0 "J3" H 10338 3163 50  0000 L CNN
F 1 "Conn_01x01_Shielded" H 10338 3072 50  0000 L CNN
F 2 "" H 10250 3200 50  0001 C CNN
F 3 "~" H 10250 3200 50  0001 C CNN
	1    10250 3200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic_Shielded:Conn_01x01_Shielded J4
U 1 1 62415533
P 10250 4400
F 0 "J4" H 10338 4363 50  0000 L CNN
F 1 "Conn_01x01_Shielded" H 10338 4272 50  0000 L CNN
F 2 "" H 10250 4400 50  0001 C CNN
F 3 "~" H 10250 4400 50  0001 C CNN
	1    10250 4400
	1    0    0    -1  
$EndComp
Text Notes 10350 2450 0    50   ~ 0
Dummy Load (DL)
Wire Wire Line
	8800 3000 9450 3000
Wire Wire Line
	9450 3000 9450 2200
Wire Wire Line
	9450 2200 10050 2200
Wire Wire Line
	8800 3200 9450 3200
Wire Wire Line
	9450 3200 9450 4900
Wire Wire Line
	9450 4900 8800 4900
Wire Wire Line
	8800 4800 9550 4800
Wire Wire Line
	9550 4800 9550 4600
Wire Wire Line
	9550 3200 10050 3200
$Comp
L power:GND #PWR?
U 1 1 62424E1A
P 9150 3450
F 0 "#PWR?" H 9150 3200 50  0001 C CNN
F 1 "GND" H 9155 3277 50  0000 C CNN
F 2 "" H 9150 3450 50  0001 C CNN
F 3 "" H 9150 3450 50  0001 C CNN
	1    9150 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62425884
P 9150 5250
F 0 "#PWR?" H 9150 5000 50  0001 C CNN
F 1 "GND" H 9155 5077 50  0000 C CNN
F 2 "" H 9150 5250 50  0001 C CNN
F 3 "" H 9150 5250 50  0001 C CNN
	1    9150 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 3100 9650 1150
Wire Wire Line
	9650 1150 10050 1150
Wire Wire Line
	8800 3100 9650 3100
Wire Wire Line
	8800 5000 9650 5000
Wire Wire Line
	9650 5000 9650 4400
Wire Wire Line
	9650 4400 10050 4400
Wire Wire Line
	9550 3200 9550 2600
Wire Wire Line
	9550 2600 8800 2600
Connection ~ 9550 3200
Wire Wire Line
	9150 3450 9150 2700
Wire Wire Line
	9150 2700 8800 2700
Wire Wire Line
	9150 5250 9150 4500
Wire Wire Line
	9150 4500 8800 4500
Wire Wire Line
	8800 4600 9550 4600
Connection ~ 9550 4600
Wire Wire Line
	9550 4600 9550 3200
Wire Wire Line
	9650 4400 8800 4400
Connection ~ 9650 4400
$Comp
L power:GND #PWR?
U 1 1 62434F37
P 10250 1450
F 0 "#PWR?" H 10250 1200 50  0001 C CNN
F 1 "GND" H 10255 1277 50  0000 C CNN
F 2 "" H 10250 1450 50  0001 C CNN
F 3 "" H 10250 1450 50  0001 C CNN
	1    10250 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62435B76
P 10250 2500
F 0 "#PWR?" H 10250 2250 50  0001 C CNN
F 1 "GND" H 10255 2327 50  0000 C CNN
F 2 "" H 10250 2500 50  0001 C CNN
F 3 "" H 10250 2500 50  0001 C CNN
	1    10250 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62436174
P 10250 3500
F 0 "#PWR?" H 10250 3250 50  0001 C CNN
F 1 "GND" H 10255 3327 50  0000 C CNN
F 2 "" H 10250 3500 50  0001 C CNN
F 3 "" H 10250 3500 50  0001 C CNN
	1    10250 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62436EAD
P 10250 4700
F 0 "#PWR?" H 10250 4450 50  0001 C CNN
F 1 "GND" H 10255 4527 50  0000 C CNN
F 2 "" H 10250 4700 50  0001 C CNN
F 3 "" H 10250 4700 50  0001 C CNN
	1    10250 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 4700 10250 4600
Wire Wire Line
	10250 3500 10250 3400
Wire Wire Line
	10250 2500 10250 2400
Wire Wire Line
	10250 1450 10250 1350
Text Notes 10350 3450 0    50   ~ 0
Antenna 1 (ANT1)
Text Notes 10350 4650 0    50   ~ 0
Antenna 2 (ANT2)
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 6244025A
P 7550 3500
F 0 "Q1" H 7740 3546 50  0000 L CNN
F 1 "2N3904" H 7740 3455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7750 3425 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 7550 3500 50  0001 L CNN
	1    7550 3500
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q2
U 1 1 62440DF9
P 7550 5300
F 0 "Q2" H 7740 5346 50  0000 L CNN
F 1 "2N3904" H 7740 5255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7750 5225 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 7550 5300 50  0001 L CNN
	1    7550 5300
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D1
U 1 1 624414EF
P 7650 2900
F 0 "D1" V 7604 2979 50  0000 L CNN
F 1 "1N4007" V 7695 2979 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 7650 2725 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 7650 2900 50  0001 C CNN
	1    7650 2900
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4007 D2
U 1 1 6244247B
P 7650 4700
F 0 "D2" V 7604 4779 50  0000 L CNN
F 1 "1N4007" V 7695 4779 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 7650 4525 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 7650 4700 50  0001 C CNN
	1    7650 4700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62449077
P 7650 3700
F 0 "#PWR?" H 7650 3450 50  0001 C CNN
F 1 "GND" H 7655 3527 50  0000 C CNN
F 2 "" H 7650 3700 50  0001 C CNN
F 3 "" H 7650 3700 50  0001 C CNN
	1    7650 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6244972F
P 7650 5500
F 0 "#PWR?" H 7650 5250 50  0001 C CNN
F 1 "GND" H 7655 5327 50  0000 C CNN
F 2 "" H 7650 5500 50  0001 C CNN
F 3 "" H 7650 5500 50  0001 C CNN
	1    7650 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 6244AE1F
P 7150 2900
F 0 "C1" H 7242 2946 50  0000 L CNN
F 1 "0.1u" H 7242 2855 50  0000 L CNN
F 2 "" H 7150 2900 50  0001 C CNN
F 3 "~" H 7150 2900 50  0001 C CNN
	1    7150 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 6244B670
P 7150 4700
F 0 "C2" H 7242 4746 50  0000 L CNN
F 1 "0.1u" H 7242 4655 50  0000 L CNN
F 2 "" H 7150 4700 50  0001 C CNN
F 3 "~" H 7150 4700 50  0001 C CNN
	1    7150 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6244F387
P 7150 3000
F 0 "#PWR?" H 7150 2750 50  0001 C CNN
F 1 "GND" H 7155 2827 50  0000 C CNN
F 2 "" H 7150 3000 50  0001 C CNN
F 3 "" H 7150 3000 50  0001 C CNN
	1    7150 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62450CF6
P 7150 4800
F 0 "#PWR?" H 7150 4550 50  0001 C CNN
F 1 "GND" H 7155 4627 50  0000 C CNN
F 2 "" H 7150 4800 50  0001 C CNN
F 3 "" H 7150 4800 50  0001 C CNN
	1    7150 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4550 7650 4500
Wire Wire Line
	7650 4500 8000 4500
Wire Wire Line
	7150 4600 7150 4500
Wire Wire Line
	7150 4500 7650 4500
Connection ~ 7650 4500
Wire Wire Line
	8000 4900 7650 4900
Wire Wire Line
	7650 4900 7650 4850
Wire Wire Line
	7650 4900 7650 5100
Connection ~ 7650 4900
Wire Wire Line
	8000 2700 7650 2700
Wire Wire Line
	7650 2700 7650 2750
Wire Wire Line
	7650 2700 7150 2700
Wire Wire Line
	7150 2700 7150 2800
Connection ~ 7650 2700
Wire Wire Line
	7650 3050 7650 3100
Wire Wire Line
	7650 3100 8000 3100
Wire Wire Line
	7650 3100 7650 3300
Connection ~ 7650 3100
$Comp
L Device:R_Small_US R2
U 1 1 624567E3
P 7150 5300
F 0 "R2" V 6945 5300 50  0000 C CNN
F 1 "4.7K" V 7036 5300 50  0000 C CNN
F 2 "" H 7150 5300 50  0001 C CNN
F 3 "~" H 7150 5300 50  0001 C CNN
	1    7150 5300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R1
U 1 1 62456F7A
P 7150 3500
F 0 "R1" V 6945 3500 50  0000 C CNN
F 1 "4.7K" V 7036 3500 50  0000 C CNN
F 2 "" H 7150 3500 50  0001 C CNN
F 3 "~" H 7150 3500 50  0001 C CNN
	1    7150 3500
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 6245884C
P 7650 2550
F 0 "#PWR?" H 7650 2400 50  0001 C CNN
F 1 "+12V" H 7665 2723 50  0000 C CNN
F 2 "" H 7650 2550 50  0001 C CNN
F 3 "" H 7650 2550 50  0001 C CNN
	1    7650 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 62459AE0
P 7650 4350
F 0 "#PWR?" H 7650 4200 50  0001 C CNN
F 1 "+12V" H 7665 4523 50  0000 C CNN
F 2 "" H 7650 4350 50  0001 C CNN
F 3 "" H 7650 4350 50  0001 C CNN
	1    7650 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2550 7650 2700
Wire Wire Line
	7650 4350 7650 4500
Wire Wire Line
	7250 3500 7350 3500
Wire Wire Line
	7250 5300 7350 5300
$Comp
L Device:C_Small C3
U 1 1 624621B2
P 6900 3700
F 0 "C3" H 6992 3746 50  0000 L CNN
F 1 "0.1u" H 6992 3655 50  0000 L CNN
F 2 "" H 6900 3700 50  0001 C CNN
F 3 "~" H 6900 3700 50  0001 C CNN
	1    6900 3700
	1    0    0    -1  
$EndComp
$Comp
L MCU_Module:Arduino_Nano_v2.x A?
U 1 1 62463E81
P 3500 5050
F 0 "A?" H 3500 3869 50  0000 C CNN
F 1 "Arduino_Nano_v2.x" H 3500 3960 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 3500 5050 50  0001 C CIN
F 3 "https://www.arduino.cc/en/uploads/Main/ArduinoNanoManual23.pdf" H 3500 5050 50  0001 C CNN
	1    3500 5050
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 62465AAE
P 6900 5500
F 0 "C4" H 6992 5546 50  0000 L CNN
F 1 "0.1u" H 6992 5455 50  0000 L CNN
F 2 "" H 6900 5500 50  0001 C CNN
F 3 "~" H 6900 5500 50  0001 C CNN
	1    6900 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62467842
P 6900 3800
F 0 "#PWR?" H 6900 3550 50  0001 C CNN
F 1 "GND" H 6905 3627 50  0000 C CNN
F 2 "" H 6900 3800 50  0001 C CNN
F 3 "" H 6900 3800 50  0001 C CNN
	1    6900 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62468F4A
P 6900 5600
F 0 "#PWR?" H 6900 5350 50  0001 C CNN
F 1 "GND" H 6905 5427 50  0000 C CNN
F 2 "" H 6900 5600 50  0001 C CNN
F 3 "" H 6900 5600 50  0001 C CNN
	1    6900 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 5300 6900 5300
Wire Wire Line
	6900 5300 6900 5400
Wire Wire Line
	7050 3500 6900 3500
Wire Wire Line
	6900 3500 6900 3600
Wire Wire Line
	4000 4850 6250 4850
Wire Wire Line
	6250 4850 6250 5300
Wire Wire Line
	6250 5300 6900 5300
Connection ~ 6900 5300
Wire Wire Line
	4000 4750 6250 4750
Wire Wire Line
	6250 4750 6250 3500
Wire Wire Line
	6250 3500 6900 3500
Connection ~ 6900 3500
$EndSCHEMATC
