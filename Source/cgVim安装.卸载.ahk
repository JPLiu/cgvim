;ccaiai install Vim hijack
RegRead, Hijack, HKLM, SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe,debugger
;MsgBox %hijack%
If(Hijack!=""){
	RegDelete HKLM, SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe,debugger
	TrayTip,,NotepadΪĬ�ϱ༭��,2000
	Sleep ,1500
	}
Else{
	RegWrite, REG_SZ, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe , debugger, ccaiai
	RegRead, Hijack, HKLM, SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe,debugger
	If(Hijack!="ccaiai"){
	MsgBox, 16,���꣬��װ��xx��ʿ��,��ر�xxx��ȫ��ʿ�����ұ������ܺ����ԡ�`n `n360xx��ʿ�Ľ��÷���Ϊ��`n�����Ҽ���>ľ�����ǽ��>���á�>�߼����á�>���ұ��� `n`n��ɽ���Խ��÷���Ϊ��`n���á�>ϵͳ������>ϵͳ�ں˱���
	ExitApp
	}
	HijackPath=%A_WorkingDir%\cgvim.exe
	RegWrite, REG_SZ, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe , debugger, %HijackPath%
	TrayTip,,cGvimΪĬ�ϱ༭��,2000
	Sleep ,1500
}