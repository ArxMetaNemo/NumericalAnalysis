#include once "Matrix.bi"
#include once "RationalMatrix.bi"

Declare Function GetResidual OverLoad(ByRef A As Matrix, ByRef ResultX As Matrix)As Matrix

Declare Function GetResidual Overload(ByRef A As RationalMatrix, ByRef ResultX As RationalMatrix)As RationalMatrix
