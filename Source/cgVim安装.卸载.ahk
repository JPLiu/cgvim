;ccaiai install Vim hijack
RegRead, Hijack, HKLM, SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe,debugger
;MsgBox %hijack%
If(Hijack!=""){
	RegDelete HKLM, SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe,debugger
	TrayTip,,Notepad为默认编辑器,2000
	Sleep ,1500
	}
Else{
	RegWrite, REG_SZ, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe , debugger, ccaiai
	RegRead, Hijack, HKLM, SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe,debugger
	If(Hijack!="ccaiai"){
	MsgBox, 16,艾玛，你装了xx卫士？,请关闭xxx安全卫士的自我保护功能后再试。`n `n360xx卫士的禁用方法为：`n托盘右键—>木马防火墙—>设置—>高级设置—>自我保护 `n`n金山毒霸禁用方法为：`n设置—>系统保护—>系统内核保护
	ExitApp
	}
	HijackPath=%A_WorkingDir%\cgvim.exe
	RegWrite, REG_SZ, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe , debugger, %HijackPath%
	TrayTip,,cGvim为默认编辑器,2000
	Sleep ,1500
}