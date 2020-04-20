full_command_line := DllCall("GetCommandLine", "str")
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}
;ccaiai install Vim hijack
RegRead, Hijack, HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe, debugger
;MsgBox %hijack%
If(Hijack!=""){
	RegDelete HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe, debugger
	TrayTip, , Notepad为默认编辑器, 2000
	Sleep, 1500
	}
Else{
	RegWrite, REG_SZ, HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe, debugger, ccaiai
	RegRead, Hijack, HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe, debugger
	If(Hijack!="ccaiai"){
	MsgBox, 16, 设置 cGvim 为默认编辑器失败，请关闭安全软件后重试。
	ExitApp
	}
	HijackPath=%A_WorkingDir%\cgvim.exe
	RegWrite, REG_SZ, HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe, debugger, %HijackPath%
	TrayTip, , cGvim为默认编辑器, 2000
	Sleep, 1500
}
