Dim WshShell

Set WshShell = CreateObject( "Wscript.Shell")
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", 0, "REG_DWORD"

Const MY_COMPUTER = &H11&
Set objNetwork = CreateObject("Wscript.Network")
strComputer = objNetwork.ComputerName
Set objShell = CreateObject("Shell.Application")
Set objFolder = objShell.Namespace(MY_COMPUTER)
Set objFolderItem = objFolder.Self
objFolderItem.Name = "Компьютер: " & strComputer