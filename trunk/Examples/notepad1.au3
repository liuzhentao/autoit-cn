;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jonathan Bennett (jon@hiddensoft.com)
;
; Script Function:
;   Opens Notepad, types in some text and then quits.
;


; Prompt the user to run the script - use a Yes/No prompt (4 - see help file)
$answer = MsgBox(4, "AutoIt ���� (����)", "������ӻ������м��±�������һЩ���ֲ��˳�.  ����?")


; Check the user's answer to the prompt (see the help file for MsgBox return values)
; If "No" was clicked (7) then exit the script
If $answer = 7 Then
    MsgBox(0, "AutoIt", "�õ�,�ټ�!")
    Exit
EndIf


; Run Notepad
Run("notepad.exe")


; Wait for the Notepad become active - it is titled "Untitled - Notepad" on English systems
WinWaitActive("�ޱ��� - ���±�")


; Now that the Notepad window is active type some text
Send("Hello from Notepad.{ENTER}1 2 3 4 5 6 7 8 9 10{ENTER}")
Sleep(500)
Send("+{UP 2}")
Sleep(500)


; Now quit by pressing Alt-f and then x (File menu -> Exit)
Send("!f")
Send("x")


; Now a screen will pop up and ask to save the changes, the window is called 
; "Notepad" and has some text "Yes" and "No"
WinWaitActive("���±�", "��")
Send("n")


; Now wait for Notepad to close before continuing
WinWaitClose("�ޱ��� - ���±�")


; Finished!