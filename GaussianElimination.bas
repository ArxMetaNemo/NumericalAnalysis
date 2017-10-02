#include once "GaussianElimination.bi"
#include once "Rational.bi"
#include once "PrintMatrix.bi"

Function GaussianElimination OverLoad(ByRef A As Matrix)As Matrix
	var TempA = A
	
	For Row As Integer = 0 To TempA.RowsCount - 2
		
		For NextRow As Integer = Row + 1 To TempA.RowsCount - 1
			
			var m = - TempA.GetValue(NextRow, Row) / TempA.GetValue(Row, Row)
			
			For Col As Integer = Row To TempA.ColsCount - 1
				
				var NewValue = TempA.GetValue(NextRow, Col) + m * TempA.GetValue(Row, Col)
				TempA.SetValue(NextRow, Col, NewValue)
				
			Next
			
		Next
		
	Next
	
	Dim ResultX As Matrix = Type<Matrix>(1, A.RowsCount)
	
	For Row As Integer = TempA.RowsCount - 1 To 0 Step -1
		
		Dim subs As Double
		For NextCol As Integer = TempA.ColsCount - 2 To Row + 1 Step -1
			subs += ResultX.GetValue(0, NextCol) * TempA.GetValue(Row, NextCol)
		Next
		
		var b = TempA.FreeMembersCols(Row)
		var x = (b - subs) / TempA.GetValue(Row, Row)
		ResultX.SetValue(0, Row, x)
		
	Next
	
	Return ResultX
End Function

Function GaussianElimination OverLoad(ByRef A As RationalMatrix)As RationalMatrix
	var TempA = A
	
	For Row As Integer = 0 To TempA.RowsCount - 2
		
		For NextRow As Integer = Row + 1 To TempA.RowsCount - 1
			
			var m = - TempA.GetValue(NextRow, Row) / TempA.GetValue(Row, Row)
			
			For Col As Integer = Row To TempA.ColsCount - 1
				
				var NewValue = TempA.GetValue(NextRow, Col) + m * TempA.GetValue(Row, Col)
				TempA.SetValue(NextRow, Col, NewValue)
				
			Next
			
		Next
		
	Next
	
	Dim ResultX As RationalMatrix = Type<RationalMatrix>(1, A.RowsCount)
	
	For Row As Integer = TempA.RowsCount - 1 To 0 Step -1
		
		Dim subs As Rational
		For NextCol As Integer = TempA.ColsCount - 2 To Row + 1 Step -1
			subs += ResultX.GetValue(0, NextCol) * TempA.GetValue(Row, NextCol)
		Next
		
		var b = TempA.FreeMembersCols(Row)
		var x = (b - subs) / TempA.GetValue(Row, Row)
		ResultX.SetValue(0, Row, x)
		
	Next
	
	Return ResultX
End Function
