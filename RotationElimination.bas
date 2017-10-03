#include once "RotationElimination.bi"

Function RotationElimination OverLoad(ByRef A As Matrix)As Matrix
	var TempA = A
	
	For Row As Integer = 0 To TempA.RowsCount - 1
		For NextRow As Integer = Row + 1 To TempA.RowsCount - 1
			var a11 = TempA.GetValue(Row, Row)
			var a21 = TempA.GetValue(NextRow, Row)
			
			var DivisorSqr = Sqr(a11 * a11 + a21 * a21)
			var c1 = a11 / DivisorSqr
			var s1 = a21 / DivisorSqr
			
			For Col As Integer = Row To TempA.ColsCount - 1
				TempA.SetValue(Row,     Col,  c1 * TempA.GetValue(Row, Col) + s1 * TempA.GetValue(NextRow, Col))
				TempA.SetValue(NextRow, Col, -s1 * TempA.GetValue(Row, Col) + c1 * TempA.GetValue(NextRow, Col))
			Next
		Next
	Next
	
	Dim ResultX As Matrix = Type<Matrix>(A.RowsCount, 1)
	
	For Row As Integer = TempA.RowsCount - 1 To 0 Step -1
		
		Dim subs As Double
		For NextCol As Integer = TempA.ColsCount - 2 To Row + 1 Step -1
			subs += ResultX.GetValue(NextCol, 0) * TempA.GetValue(Row, NextCol)
		Next
		
		var b = TempA.FreeMembersCols(Row)
		var x = (b - subs) / TempA.GetValue(Row, Row)
		ResultX.SetValue(Row, 0, x)
		
	Next
	
	Return ResultX
End Function

Function RotationElimination OverLoad(ByRef A As RationalMatrix)As RationalMatrix
	var TempA = A
	
	For Row As Integer = 0 To TempA.RowsCount - 1
		For NextRow As Integer = Row + 1 To TempA.RowsCount - 1
			var a11 = TempA.GetValue(Row, Row)
			var a21 = TempA.GetValue(NextRow, Row)
			
			var DivisorSqr = a11 * a11 + a21 * a21
			DivisorSqr.m = CInt(Sqr(DivisorSqr.m))
			DivisorSqr.n = CInt(Sqr(DivisorSqr.n))
			
			var c1 = a11 / DivisorSqr
			var s1 = a21 / DivisorSqr
			
			For Col As Integer = Row To TempA.ColsCount - 1
				TempA.SetValue(Row,     Col,  c1 * TempA.GetValue(Row, Col) + s1 * TempA.GetValue(NextRow, Col))
				TempA.SetValue(NextRow, Col, -s1 * TempA.GetValue(Row, Col) + c1 * TempA.GetValue(NextRow, Col))
			Next
		Next
	Next
	
	Dim ResultX As RationalMatrix = Type<RationalMatrix>(A.RowsCount, 1)
	
	For Row As Integer = TempA.RowsCount - 1 To 0 Step -1
		
		Dim subs As Rational
		For NextCol As Integer = TempA.ColsCount - 2 To Row + 1 Step -1
			subs += ResultX.GetValue(NextCol, 0) * TempA.GetValue(Row, NextCol)
		Next
		
		var b = TempA.FreeMembersCols(Row)
		var x = (b - subs) / TempA.GetValue(Row, Row)
		ResultX.SetValue(Row, 0, x)
		
	Next
	
	Return ResultX
End Function
