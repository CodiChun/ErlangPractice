-module(function_practice).
-import(lists, [map/2]).
-import(lists, [foldl/3]).
-import(lists, [filter/2]).

-compile(export_all).

% Codi Chun


%1
% function myDiv that takes one argument; if the value of this argument is the atom integer, then myDiv 
% returns a function that takes two values and divides them using integer division (the second argument 
% is the divisor); if the value of the myDiv argument is the atom float, it returns a functions that takes 
% two values and divides them using real number division (the second argument is the divisor). Write 
% the functions to be returned as anonymous functions inside the body of myDiv. 
myDiv(N) when N == integer -> fun(X, Y) -> X div Y end;
myDiv(N) when N == float -> fun(X, Y) -> X / Y end.

%2
% Function  cuboidVolume  that  takes  two  arguments  that  represent  the  length  and  width  of  a  cuboid 
% (box-shaped  object)  and  returns  a  function.  This  function  is  set  up  to  take  the  height  of  that  cuboid 
% and to return the volume of that cuboid using the following formula:
% Volume = Length x Width x Height
cuboidVolume(L, W) -> fun(H) -> L * W * H end.

%3
% Function mapReduce  that takes 4 parameters: two functions (the first will be used in lists:map, 
% the second one in lists:foldl), an accumulator value for fold, and a list, and returns a value 
% calculated by first applying a map to the list, then applying a fold to the list returned from the map; 
% use map and fold defined in the list library but NOT mapfold; for example if the first function flips the 
% sign and the second one calculates the product, then the list [3,6] should result in [-3,-6] after sending 
% it to the map, and in 18 after sending it to fold
mapReduce(Map, Fold, Acc, List) ->
    Mapped = lists: map(Map, List),
    lists: foldl(Fold, Acc, Mapped).

flip(N) -> -1 * N.

%4
% Function myPartition that behaves exactly like lists:partition does, i.e. you are writing your 
% own implementation of this function, as if the library one was not available; you can/should use 
% lists:filter though while implementing this function.
myPartition(Pred, List) ->
    Valid = lists: filter(Pred, List),
    [Valid] ++ [List -- Valid].
