VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm1 
   Caption         =   "rectangle form"
   ClientHeight    =   5436
   ClientLeft      =   108
   ClientTop       =   456
   ClientWidth     =   11844
   OleObjectBlob   =   "UserForm1.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "UserForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Dim hwnd As Long

Private Declare PtrSafe Function MoveToEx Lib "gdi32" (ByVal hdc As LongPtr, ByVal X As Long, ByVal Y As Long) As Long
Private Declare PtrSafe Function LineTo Lib "gdi32" (ByVal hdc As LongPtr, ByVal X As Long, ByVal Y As Long) As Long
Private Declare PtrSafe Sub Ellipse Lib "gdi32" (ByVal hdc As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long)
Private Declare PtrSafe Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare PtrSafe Function ReleaseDC Lib "user32" (ByVal hwnd As Long, ByVal hdc As Long) As Long
Private Declare PtrSafe Function SetDCBrushColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare PtrSafe Function GetForegroundWindow Lib "user32" () As Long
Private Declare PtrSafe Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare PtrSafe Function SetDCPenColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare PtrSafe Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As LongPtr)

Sub Desenharcirculo(ByVal hwnd As Long, ByVal cor As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long)
    Dim hdc As Long
    Dim a As Long
    ' Obtém o contexto de dispositivo para a janela
    hdc = GetDC(hwnd)

    ' Define a cor da caneta
    SetDCBrushColor hdc, cor

    ' Desenha o retângulo
    a = MoveToEx(hdc, x1, y1)
    a = LineTo(hdc, x2, y2)
    
    ' Libera o contexto de dispositivo
    ReleaseDC hwnd, hdc
End Sub

Private Sub UserForm_Activate()
    Dim TheDate As Date    ' Declare variables.
    Dim Msg
    TheDate = #1/1/2024#

    Me.Repaint
    Dim count As Long
    hwnd = GetForegroundWindow() ' Obter a janela com foco
    For n = 0 To Int(Me.Height * 1.5) Step 8
        Desenharcirculo hwnd, RGB(0, 0, 0), 0, n, Int(Me.Width * 1.7), n
    Next
    For n = 0 To Int(Me.Width * 1.7) Step 8
        Desenharcirculo hwnd, RGB(0, 0, 0), n, 0, n, Int(Me.Height * 1.5)
        
    Next
    
    While True
    DoEvents
    
    Me.Caption = DateDiff("s", Now, TheDate) & " seconds to 2024 "
    Sleep 1000
    count = count + 1
    Wend
End Sub

Private Sub UserForm_Initialize()

Me.Repaint



End Sub





Private Sub UserForm_Resize()

End Sub

Private Sub UserForm_Terminate()
End
End Sub
