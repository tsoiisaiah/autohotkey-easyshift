#Requires AutoHotkey v2.0
; https://www.autohotkey.com/docs/v2/Hotkeys.htm
/*
Simulate teh Roccat Easy-Shift feature
Easy-Shift button: Button 4 (Usually the back button)
Action when Easy-Shift button is active
  Back - Left Click
  Forward - Right Click
  Mute - Middle Click
  Scroll - Volumn adjustment
*/

/*
LayerShift setup
*/
global layerShift := false

XButton1::
{
    global layerShift := true
    return
}

XButton1 Up::
{
    global layerShift := false
    return
}

/*
Override buttons
*/

; Ignore input if layer shift is enabled
LButton::
{
    if !layerShift
        Send "{LButton Down}"
}

LButton Up::
{
    if layerShift
        Send "{XButton1}"
    else
        Send "{LButton Up}"
}

RButton::
{
    if !layerShift
        Send "{RButton Down}"
}

RButton Up::
{
    if layerShift
        Send "{XButton2}"
    else
        Send "{RButton}"
}

MButton::
{
    if layerShift
        Send "{Volume_Mute}"
    else
        Send "{MButton Down}"
}

MButton Up::
{
    if !layerShift
        Send "{MButton Up}"
}

WheelUp::
{
    if layerShift
        Send "{Volume_Up}"
    else
        Send "{WheelUp}"
}

WheelDown::
{
    if layerShift
        Send "{Volume_Down}"
    else
        Send "{WheelDown}"
}

/*
Hotkey for stopping the script, LAlt+LCtrl+LShift+Esc
*/
#SuspendExempt
<!<^<+Escape::Suspend   ;   LAlt+LCtrl+LShift+Esc
#SuspendExempt False