#include once "Matrix.bi"
#include once "LoadMatrix.bi"

Dim A As Matrix Ptr = CreateMatrix()

For Row As Integer = 0 To A->RowsCount - 1
	For Col As Integer = 0 To A->ColsCount - 1
		Print A->GetValue(Row, Col),
	Next
	Print
Next

Delete(a)
