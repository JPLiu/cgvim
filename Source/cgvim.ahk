;ccaiai vim hijack
cpath =
Loop, %0%
{
    param := %A_Index%
    If param not contains notepad.exe
    cpath = %cpath% %param%
}
Run gVim.exe -p --remote-tab-silent "%cpath%"