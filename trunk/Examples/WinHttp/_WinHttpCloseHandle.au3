
#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <WinHTTP.au3>

Opt(" MustDeclareVars ", 1)

; ��ʼ������ȡ�Ự���
Global $hOpen = _WinHttpOpen()
If @error Then
	msgbox(48, "Error ", "Error initializing the usage of WinHTTP functions. ")
	Exit 1
EndIf

; �رվ��
_WinHttpCloseHandle($hOpen)
If @error Then
	msgbox(48, "Error ", "Error closing the handle." & @CRLF & " Error number is" & @error)
Else
	msgbox(64, "Closed ", "Handle is succesfully closed. ")
EndIf
