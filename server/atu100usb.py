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
    def __init__(self, ser):
        self.__ser = ser
        self.__lock = threading.Lock()
        self.__pwr = 0.0
        self.__swr = 0.0
        self.__ind = 0.0
        self.__cap = 0.0
        self.__pwr_hook = None
        self.__swr_hook = None
        self.__ind_hook = None
        self.__cap_hook = None        
        self.__done = False

    def setHookPower(self, hook=None):
        self.__pwr_hook = hook

    def setHookSWR(self, hook=None):
        self.__swr_hook = hook

    def setHookInductance(self, hook=None):
        self.__ind_hook = hook

    def setHookCapacitance(self, hook=None):
        self.__cap_hook = hook

    def setPower(self, pwr):
        with self.__lock:
            self.__pwr = pwr
            if (self.__pwr_hook != None):
                self.__pwr_hook(self.__pwr)

    def getPower(self):
        with self.__lock:
            return self.__pwr

    def setSWR(self, swr):
        with self.__lock:
            self.__swr = swr
            if (self.__swr_hook != None):
                self.__swr_hook(self.__swr)

    def getSWR(self):
        with self.__lock:
            return self.__swr

    def setInductance(self, ind):
        with self.__lock:
            self.__ind = ind
            if (self.__ind_hook != None):
                self.__ind_hook(self.__ind)
    
    def getInductance(self):
        with self.__lock:
            return self.__ind

    def setCapacitance(self, cap):
        with self.__lock:
            self.__cap = cap
            if (self.__cap_hook != None):
                self.__cap_hook(self.__cap)

    def getCapacitance(self):
        with self.__lock:
            return self.__cap

    def processSerial(self):
        while not self.__done:
            data = self.__ser.readline().decode()
            pwr = pwrRegEx.search(data)
            ind = indRegEx.search(data)
            cap = capRegEx.search(data)
            swr = swrRegEx.search(data)	
            if (pwr != None):
                self.setPower(pwr.group(1))
                print("Power: " + self.getPower())
            if (swr != None):
                self.setSWR(swr.group(1))
                print("SWR: " + self.getSWR())
            if (ind != None):
                self.setInductance(ind.group(1))
                print("Inductance: " + self.getInductance())
            if (cap != None):
                self.setCapacitance(cap.group(1))
                print("Capacitance: " + self.getCapacitance())

#command_table = {
#    'p': tun.getPower,
#    's': tun.getSWR,
#    'c': tun.getCapacitance,
#    'i': tun.getInductance,
#}
#
#def handle_command(cmd, action):
#    action(command_table[cmd.strip()]())
#
#def handle_console(frame):
#    while not quit:
#        print("Enter a command: ")
#        handle_command(input(), print)
#        print(frame.pwrText.GetValue())

if __name__ == "__main__":
    app = TunerApp(0)

    tun = TunerData(serial.Serial("/dev/ttyUSB0", 9600))
    tun.setHookPower(lambda x:app.frame.pwrText.SetValue("PWR = " + x + " W"))
    tun.setHookSWR(lambda x:app.frame.swrText.SetValue("SWR = " + x))
    tun.setHookInductance(lambda x:app.frame.indText.SetValue("L = " + x + " uH"))
    tun.setHookCapacitance(lambda x:app.frame.capText.SetValue("C = " + x + " pF"))

    meter = threading.Thread(target=tun.processSerial)
    meter.start()

    #console = threading.Thread(target=lambda:handle_console(app.frame))
    #console.start()

    app.MainLoop()

    #app = wx.App(redirect=True)   # Error messages go to popup window
    #top = Frame("<<project>>")
    #top.Show()
    #app.MainLoop()

    #console.join()
    meter.join()