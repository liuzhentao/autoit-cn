﻿If $var > 0 Then
	MsgBox(4096,"", "Value is positive.")
ElseIf $var < 0 Then
	MsgBox(4096,"", "Value is negative.")
Else
	If StringIsXDigit ($var) Then
		MsgBox(4096,"", "Value might be hexadecimal!")
	Else
		MsgBox(4096,"", "Value is either a string or is zero.")
	EndIf
EndIf
