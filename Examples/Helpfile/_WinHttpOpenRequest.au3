#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include "WinHttp.au3"

Opt("MustDeclareVars", 1)

; !!!ע������û�����������Ч, ��ô�����ӽ�ʧ��!!!

; ������֤����
Global $sUsername = "UserName"
Global $sPassword = "Password"

; ��ַ
Global $sAddress = "space.livevn.com"

; ��ʼ������ȡ�Ự���
Global $hOpen = _WinHttpOpen()

; ��ȡ���Ӿ��
Global $hConnect = _WinHttpConnect($hOpen, $sAddress)

; ����
Global $hRequest = _WinHttpOpenRequest($hConnect, _
		"POST", _ ; ����
		"/do.php?ac=71ee30ae117cddace55bd01714904227&&ref", _  ; Ŀ��
		Default, _ ; �汾
		"http://space.livevn.com/index.php", _  ; referer
		"*/*") ; ����

; ������
_WinHttpSendRequest($hRequest, _
		"Content-Type: application/x-www-form-urlencoded" & @CRLF, _
		"username=" & $sUsername & "&password=" & $sPassword & "&loginsubmit=&loginsubmit=loginnnnnnnnnnn&refer=network.html&formhash=c51a94db")

; �ȴ���Ӧ
_WinHttpReceiveResponse($hRequest)

; �������ص���ʲô
If _WinHttpQueryDataAvailable($hRequest) Then
	Global $sHeader = _WinHttpQueryHeaders($hRequest)
	ConsoleWrite($sHeader & @CRLF)
	; ����Ƿ����ʵ��� cookie
	If StringInStr($sHeader, 'Set-Cookie: uchome_loginuser=' & $sUsername) Then
		MsgBox(0, "", "Login success")
	Else
		MsgBox(0, "", "Login failed")
	EndIf
Else
	MsgBox(48, "Error", "Site is experiencing problems.")
EndIf


; �رմ򿪵ľ�����˳�
_WinHttpCloseHandle($hRequest)
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hOpen)