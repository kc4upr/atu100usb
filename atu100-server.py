import re
import serial

ser = serial.Serial("/dev/ttyUSB0", 9600)
pwrRegEx = re.compile(r"(\d+\.\d+)W")
indRegEx = re.compile(r"L=(\d+\.\d+)u")
capRegEx = re.compile(r"C= (\d+)p")
swrRegEx = re.compile(r"SWR=(\d+\.\d+)")

while True:
	data = (ser.readline()).decode()
	pwr = pwrRegEx.search(data)
	ind = indRegEx.search(data)
	cap = capRegEx.search(data)
	swr = swrRegEx.search(data)
	if (pwr != None):
		print("Power: " + pwr.group(1))
	if (swr != None):
		print("SWR: " + swr.group(1))
	if (ind != None):
		print("Inductance: " + ind.group(1))
	if (cap != None):
		print("Capacitance: " + cap.group(1))
	