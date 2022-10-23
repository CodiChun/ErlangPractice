-module(basic).
-export([myTan/1, isSame/2, parity/1, mealType/1, myMult/2, mySum/1, mySeries/3]).
-import(math,[sin/1, sqrt/1, pow/2]).

% Codi Chun

% 1
% Function myTan that takes one argument that represents since of an angle and returns the 
%tangent of that angle 
myTan(N) -> sin(N)/sqrt(1-pow(sin(N),2)).

% 2
% Function isSame that takes two arguments and returns true if these two values are the same 
% considering both the value and the type and false otherwise. 
isSame(N,M) -> N=:=M.

% 3
%Function parity that takes an argument and returns an atom even if the argument is an even 
%number, an atom odd if the argument is an odd number. Zero is even. 
parity(N) when (N rem 2 =:=0) -> even;
parity(N) when (N rem 2 =/=0) -> odd.

% 4
% Function mealType that takes an integer argument and returns its equivalent meal as an atom. 
mealType(N) when (N == 1) -> breakfast;
mealType(N) when (N == 2) -> lunch;
mealType(N) when (N == 3) -> dinner;
mealType(N) when (N == 4) -> appetizer;
mealType(N) when (N == 5) -> dessert;
mealType(N) when (N > 5) or (N =< 0) -> no_match.

% 5
% Function myMult that implements the recursive math formula 
myMult(M,N) when (N<0) -> (-1)*myMult(M, N*(-1));
myMult(M,N) when (M==0) or (N==0) -> 0;
myMult(M,N) when (N>0) -> M + myMult(M, N-1).

%6
% 
mySum(0) -> 0;
mySum(N) -> N + mySum(N-1).

%7 
%Function mySeries that takes 3 arguments: the value of the first term of the geometric 
%sequence, the common ratio (multiplier), and the term number for which the function is to 
%compute and return a value. 
mySeries(X,_,1) -> X;
mySeries(X,Y,Z) -> Y * mySeries(X, Y, Z-1).
