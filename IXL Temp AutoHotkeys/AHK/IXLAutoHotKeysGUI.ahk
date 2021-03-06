SetWorkingDir, %A_ScriptDir%
#Persistent
#SingleInstance, force 
#NoTrayIcon
#Include %A_ScriptDir%\Library\GUILibrary.ahk 

DetectHiddenWindows, On
SetTitleMatchMode, 2

ButtonArray := ["AHKScript", "ETemplates"]
RefArray := ["ETemplatesReferenceSheet", "HotKeyReferenceSheet"]
TapArray := ["AHKEdit", "CustomAHKView", "Reload"]

BuildButtonArray(5, 15, 200, 30, 5, ButtonArray)
BuildTapArray(210, 15, 200, 30, 5, RefArray)
BuildTapArray(415, 15, 200, 30, 5, TapArray)

Gui, Add, Radio, x25 y95 vRadioOn gTOP_ON, AHK window always displayed
Gui, Add, Radio, x225 y95 Checked vRadioOff gTOP_OFF, AHK window not always displayed 
AddGuiDimension(0,5)




BuildGui("IXL Hot Keys", 500, 500)

return 

;----------------------------------- MAIN SCRIPT BUTTON -------------------------------------------------------------------------------------------------------------
AHKScriptOn:
{
	OnButton("AHKScript", "\Scripts")
	return
}

AHKScriptOff:
{
	OffButton("AHKScript", "\Scripts")
	return 
}
;----------------------------------- ETEMPLATES -------------------------------------------------------------------------------------------------------------
ETemplatesOn:
{
	OnButton("ETemplates", "\Scripts")
	return
}

ETemplatesOff:
{
	OffButton("ETemplates", "\Scripts")
	return 
}
;-----------------------------------  REFERENCE SHEETS-------------------------------------------------------------------------------------------------------------
ETemplatesReferenceSheetOn:
{
	Tap("ETemplatesReferenceSheet", "\Scripts")
	return
}

HotKeyReferenceSheetOn:
{
	Tap("HotKeyReferenceSheet", "\Scripts")
	return
}

;-----------------------------------  CUSTOM AHK SCRIPTS-------------------------------------------------------------------------------------------------------------
AHKEditOn:
{
	Tap("AHKEdit", "\Scripts")
	return
}

CustomAHKViewOn:
{
	Tap("CustomAHKView", "\Scripts")
	return 
}
;-----------------------------------  RADIO BUTTONS--------------------------------------------------- ----------------------------------------------------------
TOP_ON:
{
	Gui, +AlwaysOnTop
	return
}

TOP_OFF:
{
	WinSet, AlwaysOnTop, Off 
	return 
}

;----------------------------------- RELOAD -------------------------------------------------------------------------------------------------------------
ReloadOn:
{
	ExitAllArray("\Scripts", ".ahk", ButtonArray, RefArray, TapArray)
	Reload 
	return 
}
;----------------------------------- GUI CLOSE -------------------------------------------------------------------------------------------------------------
GuiClose:
ExitAllArray("\Scripts", ".ahk", ButtonArray, RefArray, TapArray)
ExitApp 