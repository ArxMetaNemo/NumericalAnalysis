#ifndef unicode
#define unicode
#endif
#include once "windows.bi"
#include once "Matrix.bi"
#include once "RationalMatrix.bi"
#include once "LoadMatrix.bi"
#include once "PrintMatrix.bi"
#include once "GaussianElimination.bi"
#include once "GaussianEliminationWithMainColumns.bi"

' var A = GetRationalMatrix(GetStdHandle(STD_INPUT_HANDLE))
var A = GetMatrix(GetStdHandle(STD_INPUT_HANDLE))

PrintMatrix(A)

Print

Scope
	var ResultX = GaussianEliminationWithMainColumns(A)
	PrintMatrix(ResultX)
End Scope

' Scope
	' var Fractional = TempA.GetValue(Row, Row)
	
	' If Fractional.m = 0 Then
		' Continue For
	' End If
' End Scope


' Scope
	' var ResultX = GaussianElimination2(A)
	' PrintMatrix(ResultX)
' End Scope
