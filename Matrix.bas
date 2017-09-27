#include once "Matrix.bi"

Constructor Matrix(ByVal Rows As Integer, Cols As Integer)
	This.Rows = Rows
	This.Cols = Cols
	A = Allocate(Cols * Rows * SizeOf(Double))
End Constructor

Destructor Matrix()
	If A <> 0 Then
		DeAllocate(A)
	End If
End Destructor

Property Matrix.RowsCount()As Integer
	Return Rows
End Property

Property Matrix.ColsCount()As Integer
	Return Cols
End Property

Property Matrix.FreeMembersCols(ByVal Row As Integer)As Double
	Return A[Cols * Row + Cols - 1]
End Property

Function Matrix.GetValue(ByVal Row As Integer, ByVal Col As Integer)As Double
	Return A[Cols * Row + Col]
End Function

Sub Matrix.SetValue(ByVal Row As Integer, ByVal Col As Integer, ByVal NewValue As Double)
	A[Cols * Row + Col] = NewValue
End Sub
