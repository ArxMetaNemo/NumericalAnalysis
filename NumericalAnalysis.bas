#include once "NumericalAnalysis.bi"

var A = GetMatrix(GetStdHandle(STD_INPUT_HANDLE))
PrintMatrix(A)

Print

Scope
	var ResultX = GaussianEliminationWithMainColumns(A)
	Print "Решение"
	PrintMatrix(ResultX)
	
	Print
	
	var Residual = GetResidual(A, ResultX)
	Print "Вектор невязки"
	PrintMatrix(Residual)
End Scope

Print

Scope
	var ResultX = RotationElimination(A)
	Print "Решение"
	PrintMatrix(ResultX)
	
	Print
	
	var Residual = GetResidual(A, ResultX)
	Print "Вектор невязки"
	PrintMatrix(Residual)
End Scope