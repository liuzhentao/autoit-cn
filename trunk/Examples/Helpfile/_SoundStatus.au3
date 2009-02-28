#include <Sound.au3>
;open sound file
$sound = _SoundOpen(@WindowsDir & "\media\Windows XP Startup.wav", "Startup")
If @error = 2 Then
	MsgBox(0, "Error", "The file does not exist")
	Exit
ElseIf @error = 3 Then
	MsgBox(0, "Error", "The alias was invalid")
	Exit
ElseIf @extended <> 0 Then
	$extended = @extended ;assign because @extended will be set after DllCall
	$stText = DllStructCreate("char[128]")
	$errorstring = DllCall("winmm.dll", "short", "mciGetErrorStringA", "str", $extended, "ptr", DllStructGetPtr($stText), "int", 128)
	MsgBox(0, "Error", "The open failed." & @CRLF & "Error Number: " & $extended & @CRLF & "Error Description: " & DllStructGetData($stText, 1) & @CRLF & "Please Note: The sound may still play correctly.")
Else
	MsgBox(0, "Success", "The file opened successfully")
EndIf

ConsoleWrite("After _SoundOpen: ")
ConsoleWrite(_SoundStatus($sound) & @LF)

_SoundPlay($sound)
ConsoleWrite("After _SoundPlay: ")
ConsoleWrite(_SoundStatus($sound) & @LF)

Sleep(1000)

_SoundPause($sound)
ConsoleWrite("After _SoundPause: ")
ConsoleWrite(_SoundStatus($sound) & @LF)

Sleep(1000)
_SoundResume($sound)

While 1
	Sleep(100)
	If _SoundPos($sound, 2) = _SoundLength($sound, 2) Then ExitLoop
WEnd

_SoundClose($sound)