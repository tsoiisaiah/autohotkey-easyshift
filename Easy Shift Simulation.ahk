#Requires AutoHotkey v2.0
; https://www.autohotkey.com/docs/v2/Hotkeys.htm
/*
Simulate the Roccat Easy-Shift feature
Easy-Shift button: Button 4 (Usually the back button)
Action when Easy-Shift button is active
  Back - Left Click
  Forward - Right Click
  Mute - Middle Click
  Volumn adjustment - Scroll
*/

#InputLevel 10

$XButton1::
{
    return
}

XButton1 & LButton::
{
    Send "{XButton1 down}"
    Sleep 20
    Send "{XButton1 up}"
    Sleep 20
    return
}

XButton1 & RButton::
{
    Send "{XButton2 down}"
    Sleep 20
    Send "{XButton2 up}"
    Sleep 20
    return
}

XButton1 & MButton::
{
    KeyWait "MButton"
    Send "{Volume_Mute}"
    return
}

XButton1 & WheelUp::
{
    Send "{Volume_Up}"
    return
}

XButton1 & WheelDown::
{
    Send "{Volume_Down}"
    return
}

/*
Hotkey for stopping the script, LAlt+LCtrl+LShift+Esc
*/
#SuspendExempt
<!<^<+Escape::Suspend   ;   LAlt+LCtrl+LShift+Esc
#SuspendExempt False

/*
WriteLog(text) {
    FileAppend(A_NowUTC ": " text "`n", "logfile.txt")
}
*/
