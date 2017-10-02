#ifndef unicode
#define unicode
#endif
#include once "windows.bi"
#include once "Matrix.bi"
#include once "RationalMatrix.bi"
#include once "LoadMatrix.bi"
#include once "PrintMatrix.bi"
#include once "Residual.bi"
#include once "GaussianElimination.bi"
#include once "GaussianEliminationWithMainColumns.bi"

var A = GetMatrix(GetStdHandle(STD_INPUT_HANDLE))
PrintMatrix(A)

Print

var ResultX = GaussianEliminationWithMainColumns(A)
PrintMatrix(ResultX)

Print

var Residual = GetResidual(A, ResultX)
PrintMatrix(Residual)
