#!/usr/bin/env python
# -*- coding: UTF-8 -*-
#
# generated by wxGlade 0.9.4 on Thu Mar 24 20:07:28 2022
#

import wx

# begin wxGlade: dependencies
# end wxGlade

# begin wxGlade: extracode
# end wxGlade


class TunerFrame(wx.Frame):
    def __init__(self, *args, **kwds):
        # begin wxGlade: TunerFrame.__init__
        kwds["style"] = kwds.get("style", 0) | wx.DEFAULT_FRAME_STYLE
        wx.Frame.__init__(self, *args, **kwds)
        
        # Menu Bar
        self.menuBar = wx.MenuBar()
        wxglade_tmp_menu = wx.Menu()
        item = wxglade_tmp_menu.Append(wx.ID_ANY, "Close", "Close Window")
        self.Bind(wx.EVT_MENU, self.OnClose, id=item.GetId())
        self.menuBar.Append(wxglade_tmp_menu, "File")
        wxglade_tmp_menu = wx.Menu()
        self.menuBar.Append(wxglade_tmp_menu, "Help")
        self.SetMenuBar(self.menuBar)
        # Menu Bar end
        self.pwrText = wx.TextCtrl(self, wx.ID_ANY, "PWR = ??? W", style=wx.TE_READONLY)
        self.indText = wx.TextCtrl(self, wx.ID_ANY, "L = ??? uH", style=wx.TE_READONLY)
        self.swrText = wx.TextCtrl(self, wx.ID_ANY, "SWR = ???", style=wx.TE_READONLY)
        self.capText = wx.TextCtrl(self, wx.ID_ANY, "C = ??? pF", style=wx.TE_READONLY)
        self.resetBtn = wx.Button(self, wx.ID_ANY, "Reset")
        self.tuneBtn = wx.Button(self, wx.ID_ANY, "Tune")
        self.thruBtn = wx.ToggleButton(self, wx.ID_ANY, "Thru")
        self.autoBtn = wx.ToggleButton(self, wx.ID_ANY, "Auto")
        self.commBtn = wx.Button(self, wx.ID_ANY, "Comm")
        self.ant1Btn = wx.ToggleButton(self, wx.ID_ANY, "Ant 1")
        self.ant2Btn = wx.ToggleButton(self, wx.ID_ANY, "Ant 2")
        self.dummyBtn = wx.ToggleButton(self, wx.ID_ANY, "Dummy")

        self.__set_properties()
        self.__do_layout()

        # end wxGlade

    def __set_properties(self):
        # begin wxGlade: TunerFrame.__set_properties
        self.SetTitle("frame")
        self.pwrText.SetMinSize((160, 33))
        self.indText.SetMinSize((160, 33))
        self.swrText.SetMinSize((160, 33))
        self.capText.SetMinSize((160, 33))
        self.resetBtn.SetMinSize((80, 33))
        self.tuneBtn.SetMinSize((80, 33))
        self.thruBtn.SetMinSize((80, 33))
        self.autoBtn.SetMinSize((80, 33))
        self.commBtn.SetMinSize((80, 33))
        self.ant1Btn.SetMinSize((80, 33))
        self.ant2Btn.SetMinSize((80, 33))
        self.dummyBtn.SetMinSize((80, 33))
        # end wxGlade

    def __do_layout(self):
        # begin wxGlade: TunerFrame.__do_layout
        rowSizer = wx.BoxSizer(wx.VERTICAL)
        gridSizer2 = wx.GridSizer(2, 4, 0, 0)
        gridSizer1 = wx.GridSizer(2, 2, 0, 0)
        gridSizer1.Add(self.pwrText, 0, 0, 0)
        gridSizer1.Add(self.indText, 0, 0, 0)
        gridSizer1.Add(self.swrText, 0, 0, 0)
        gridSizer1.Add(self.capText, 0, 0, 0)
        rowSizer.Add(gridSizer1, 1, wx.EXPAND, 0)
        gridSizer2.Add(self.resetBtn, 0, 0, 0)
        gridSizer2.Add(self.tuneBtn, 0, 0, 0)
        gridSizer2.Add(self.thruBtn, 0, 0, 0)
        gridSizer2.Add(self.autoBtn, 0, 0, 0)
        gridSizer2.Add(self.commBtn, 0, 0, 0)
        gridSizer2.Add(self.ant1Btn, 0, 0, 0)
        gridSizer2.Add(self.ant2Btn, 0, 0, 0)
        gridSizer2.Add(self.dummyBtn, 0, 0, 0)
        rowSizer.Add(gridSizer2, 1, wx.ALIGN_CENTER_VERTICAL | wx.ALL | wx.EXPAND, 0)
        self.SetSizer(rowSizer)
        rowSizer.Fit(self)
        self.Layout()
        # end wxGlade

    def OnClose(self, event):  # wxGlade: TunerFrame.<event_handler>
        print("Event handler 'OnClose' not implemented!")
        event.Skip()

# end of class TunerFrame

class MyApp(wx.App):
    def OnInit(self):
        self.frame = TunerFrame(None, wx.ID_ANY, "")
        self.SetTopWindow(self.frame)
        self.frame.Show()
        return True

# end of class MyApp

if __name__ == "__main__":
    app = MyApp(0)
    app.MainLoop()
