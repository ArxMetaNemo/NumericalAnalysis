#ifndef unicode
#define unicode
#endif
#include once "windows.bi"
#include once "win\shlwapi.bi"
#include once "win\shellapi.bi"

#include once "Matrix.bi"
#include once "ConsoleReadLine.bi"

Const vbCrLf = !"\r\n"

Sub LoadRowFromString(ByRef A As Matrix Ptr, ByVal CurrentRow As Integer, ByVal MatrixString As WString Ptr)
	Dim WordsCount As Long = Any
	Dim Lines As WString Ptr Ptr = CommandLineToArgvW(MatrixString, @WordsCount)
	
	If A = 0 Then
		A = New Matrix(WordsCount - 1, WordsCount)
	End If
	
	For i As Integer = 0 To A->ColsCount - 1
		A->SetValue(CurrentRow, i, CDbl(*Lines[i]))
	Next
	LocalFree(Lines)
End Sub

Function CreateMatrix()As Matrix Ptr
	
	Dim CurrentRow As Integer
	Dim A As Matrix Ptr
	
	Dim MatrixString As WString * (ReadConsoleBufferMaxLength + 1) = Any
	
	' Добавить строки в матрицу
	Do While ConsoleReadLine(MatrixString)
		' Найти vbCrLf
		Dim wCrLf As WString Ptr = StrStr(MatrixString, @vbCrLf)
		If wCrLf = 0 Then
			' Ввод с консоли
			LoadRowFromString(A, CurrentRow, MatrixString)
			CurrentRow += 1
		Else
			Dim wStart As WString Ptr = @MatrixString
			
			Do
				wCrLf[0] = 0
				LoadRowFromString(A, CurrentRow, wStart)
				CurrentRow += 1
				
				wStart = wCrLf + 2
				
				wCrLf = StrStr(wStart, @vbCrLf)
				
			Loop While wCrLf <> 0
			
			If lstrlen(wStart) <> 0 Then
				LoadRowFromString(A, CurrentRow, wStart)
			End If
			
		End If
	Loop
	
	Return A
End Function
