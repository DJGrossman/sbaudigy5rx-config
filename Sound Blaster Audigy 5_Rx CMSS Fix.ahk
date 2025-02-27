#Requires AutoHotkey >=2.0

exePath := "C:\Program Files (x86)\Creative\SBAudigy5Rx\SB Audigy 5_RX Control Panel\AudioConsoleLauncher.exe"
winTitle := "Sound Blaster Audigy 5/Rx Control Panel"

CoordMode("Mouse", "Screen")
MouseGetPos(&xpos, &ypos)
MouseMove(0, 0, 0)
CoordMode("Mouse", "Client")

Run(exePath)
WinWait(winTitle, , 10)
if WinExist
	WinActivate
WinWaitActive

; "CMSS 3D" menu item
WaitForControlVisible("Button22")
ControlClick("Button22")
WaitForControlVisible("HKComboBoxCover_Class5")
ControlClick("HKComboBoxCover_Class5")
Send("o")
Sleep 100
Send("{Enter}")
Sleep 100

; "Stereo Direct / Bit Accurate" menu item
ControlClick("Button26")
WaitForControlVisible("Button24")
if (PixelGetColor(484, 174) = 0x2E2E2E)
{
	ControlClick("Button24")
	Sleep 100
}

WinClose
CoordMode("Mouse", "Screen")
MouseMove(xpos, ypos, 0)

WaitForControlVisible(ClassNN)
{
	Loop
	{
		isVisible := ControlGetVisible(ClassNN)

		if (isVisible)
			return true

		Sleep 10
	}
}