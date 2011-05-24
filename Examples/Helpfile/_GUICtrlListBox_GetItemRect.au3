#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

$Debug_LB = False ; Check ClassName being passed to ListBox functions, set to True and use a handle to another control to see it work

_Main()

Func _Main()
	Local $aRect, $hListBox

	; Create GUI
	GUICreate("List Box Get Item Rect", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState()

	; Add strings
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Random string", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Show item rectangle
	$aRect = _GUICtrlListBox_GetItemRect($hListBox, 4)
	MsgBox(4160, "Information", "Item 5 Rectangle: " & $aRect[0] & ", " & $aRect[1] & ", " & $aRect[2] & ", " & $aRect[3])

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
