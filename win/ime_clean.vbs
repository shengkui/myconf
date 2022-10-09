'---------------------------------------------------------------------
' Fix Win10 Chinese IME lag
'---------------------------------------------------------------------
Option Explicit

Dim WSH, FSO, ChsIMEPath
Dim Folder, Found, item

Set WSH = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")

' The full path of Chinese IME directory.
ChsIMEPath = WSH.ExpandEnvironmentStrings("%AppData%") & "\Microsoft\InputMethod\Chs\"

' Search for .tmp file under the directory.
Set Folder = FSO.GetFolder(ChsIMEPath)
Found = false                   'false: .tmp file not found.
For Each item in Folder.Files
    If lcase(right(item.name, 4)) = ".tmp" Then
       Found = true             'true: Found .tmp file.
       Exit For
    End If
Next

If Found Then
    FSO.DeleteFile ChsIMEPath & "*.tmp"     'Delete all .tmp files.
End If