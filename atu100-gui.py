#!/usr/bin/python
# -*- coding: <<encoding>> -*-
#-------------------------------------------------------------------------------
#   <<project>>
# 
#-------------------------------------------------------------------------------

import re
import serial
import sys
import threading
#import wx, wx.html
#import wxversion
#wxversion.select("2.8")

from tunergui import TunerApp

pwrRegEx = re.compile(r"(\d+\.\d+)W")
indRegEx = re.compile(r"(\d+\.\d+)u")
capRegEx = re.compile(r"(\d+)p")
swrRegEx = re.compile(r"SWR=(\d+\.\d+)")

quit = False

class TunerData:
    def __init__(self):
        self.__lock = threading.Lock()
        self.__pwr = 0.0
        self.__swr = 0.0
        self.__ind = 0.0
        self.__cap = 0.0

    def setPower(self, pwr):
        with self.__lock:
            self.__pwr = pwr

    def getPower(self):
        with self.__lock:
            return self.__pwr

    def setSWR(self, swr):
        with self.__lock:
            self.__swr = swr

    def getSWR(self):
        with self.__lock:
            return self.__swr

    def setInductance(self, ind):
        with self.__lock:
            self.__ind = ind
    
    def getInductance(self):
        with self.__lock:
            return self.__ind

    def setCapacitance(self, cap):
        with self.__lock:
            self.__cap = cap

    def getCapacitance(self):
        with self.__lock:
            return self.__cap

tun = TunerData()
ser = serial.Serial("/dev/ttyUSB0", 9600)

def read_serial_data(frame):
    while not quit:
        data = ser.readline().decode()
        pwr = pwrRegEx.search(data)
        ind = indRegEx.search(data)
        cap = capRegEx.search(data)
        swr = swrRegEx.search(data)	
        if (pwr != None):
            print("Power: " + pwr.group(1))
            tun.setPower(pwr.group(1))
            frame.pwrText.SetValue("PWR = " + tun.getPower() + " W")
        if (swr != None):
            print("SWR: " + swr.group(1))
            tun.setSWR(swr.group(1))
            frame.swrText.SetValue("SWR = " + tun.getSWR())
        if (ind != None):
            print("Inductance: " + ind.group(1))
            tun.setInductance(ind.group(1))
            frame.indText.SetValue("L = " + tun.getInductance() + " uH")
        if (cap != None):
            print("Capacitance: " + cap.group(1))
            tun.setCapacitance(cap.group(1))
            frame.capText.SetValue("C = " + tun.getCapacitance() + " pF")

command_table = {
    'p': tun.getPower,
    's': tun.getSWR,
    'c': tun.getCapacitance,
    'i': tun.getInductance,
}

def handle_command(cmd, action):
    action(command_table[cmd.strip()]())

def handle_console(frame):
    while not quit:
        print("Enter a command: ")
        handle_command(input(), print)
        print(frame.pwrText.GetValue())

def OnClose():
    quit = True

if __name__ == "__main__":
    app = TunerApp(0)

    meter = threading.Thread(target=lambda:read_serial_data(app.frame))
    meter.start()

    console = threading.Thread(target=lambda:handle_console(app.frame))
    console.start()

    app.MainLoop()

    #app = wx.App(redirect=True)   # Error messages go to popup window
    #top = Frame("<<project>>")
    #top.Show()
    #app.MainLoop()

    console.join()
    meter.join()