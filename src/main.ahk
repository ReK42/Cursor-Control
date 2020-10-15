﻿#NoEnv
#Persistent
#SingleInstance Ignore

SendMode Input
SetWorkingDir %A_ScriptDir%\..

#Requires AutoHotkey v1.1.33+

;@Ahk2Exe-SetMainIcon %A_ScriptDir%\..\res\icon.ico

; Initialize startup variables
AppName := "Cursor Control"
;@Ahk2Exe-Let Name = %A_PriorLine~^.+"(.+)".*$~$1%
AppVersion := "1.0.0"
;@Ahk2Exe-Let Version = %A_PriorLine~^.+"(.+)".*$~$1%
AppAuthor := "ReK_"
;@Ahk2Exe-Let Author = %A_PriorLine~^.+"(.+)".*$~$1%
AppLicence := "GNU GPLv3"
;@Ahk2Exe-Let Licence = %A_PriorLine~^.+"(.+)".*$~$1%
AppURL := "https://github.com/ReK42/Cursor-Control"
AppEnabled := true
AppHotkey := "PrintScreen"
;@Ahk2Exe-Obey U_Year, FormatTime U_Year`,`, yyyy
;@Ahk2Exe-Obey U_Bits, = %A_PtrSize% * 8

;@Ahk2Exe-SetName %U_Name%
;@Ahk2Exe-SetDescription Provide shortcuts for missing Home/End/Page Up/Page Down keys
;@Ahk2Exe-SetVersion %U_Version%
;@Ahk2Exe-SetCopyright Copyright (c) %U_Year%`, %U_Author%
;@Ahk2Exe-SetOrigFilename %A_ScriptName%
;@Ahk2Exe-SetLegalTrademarks %U_Licence%
;@Ahk2Exe-SetLanguage 0x1009
;@Ahk2Exe-ExeName %A_ScriptDir%\..\bin\%U_Name% v%U_Version% x%U_Bits~32~86%.exe

; Unpack the app icon
; Generated by Image2Include.ahk
CreateIcon(NewHandle := False) {
    Static hBitmap := 0
    If (NewHandle)
       hBitmap := 0
    If (hBitmap)
       Return hBitmap
    VarSetCapacity(B64, 15436 << !!A_IsUnicode)
    B64 := "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"
    If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
       Return False
    VarSetCapacity(Dec, DecLen, 0)
    If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
       Return False
    ; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
    ; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
    hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
    pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
    DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
    DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
    DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
    hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
    VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
    DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
    DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
    DllCall("Gdiplus.dll\GdipCreateHICONFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
    DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
    DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
    DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
    DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
    Return hBitmap
}
AppIcon := "HICON:*" . CreateIcon()

; Configure the system tray
Menu, Tray, Icon, %AppIcon%,, 1
Menu, Tray, NoMainWindow
Menu, Tray, NoStandard
Menu, Tray, Tip, %AppName%
Menu, Tray, Add, &Enabled, AppToggle
;Menu, Tray, Add, &Reload, AppReload  ; For debug builds
Menu, Tray, Add
Menu, Tray, Add, &About, AppAbout
Menu, Tray, Add, E&xit, AppExit
Menu, Tray, Check, &Enabled

; End of automatic execution

; Define hotkeys
; DO NOT MAKE CHANGES ABOVE THIS LINE
PrintScreen & Up::PgUp
PrintScreen & Down::PgDn
PrintScreen & Left::Home
PrintScreen & Right::End
PrintScreen::PrintScreen
; DO NOT MAKE CHANGES BELOW THIS LINE

; Toggle the hotkeys
AppToggle:
    if AppEnabled {
        Suspend, On
        AppEnabled := false
        Menu, Tray, Uncheck, &Enabled
    } else {
        Suspend, Off
        AppEnabled := true
        Menu, Tray, Check, &Enabled
    }
    Return

; Reload the script
AppReload:
    Reload
    Return

; Display an about window
AppAbout:
    MsgBox, 4096, About %AppName% %AppVersion%,
    ( LTrim
        %AppName% v%AppVersion%
        %AppAuthor%
        %AppURL%

        %AppLicence%

        This program is free software: you can redistribute it and/or modify
        it under the terms of the GNU General Public License as published by
        the Free Software Foundation, either version 3 of the License, or
        (at your option) any later version.

        This program is distributed in the hope that it will be useful,
        but WITHOUT ANY WARRANTY; without even the implied warranty of
        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
        GNU General Public License for more details.

        You should have received a copy of the GNU General Public License
        along with this program.  If not, see <https://www.gnu.org/licenses/>.



        AutoHotkey v%A_AhkVersion%
        www.autohotkey.com
        GNU GPLv2

        Arrow Keys icon by Bruno Landowski
        thenounproject.com
        CC BY 3.0
    )
    Return

; Exit the script
AppExit:
    ExitApp
