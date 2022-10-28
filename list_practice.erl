-module(list_practice).
-compile(export_all).

% Codi Chun

% 1)
% Function midCircle that that takes two tuples, where each tuple represents a circle object (each tuple 
% consists of 3 values: radius, x-coordinate, y-coordinate – in this order) and calculates and returns a new 
% tuple that represents a new circle, constructed in terms of its radius and center coordinates using the same 
% logic as function mid in lab 3. If an invalid value is passed for either radius, the function should return atom 
% wrong_radius 
midCircle({R1, _, _}, {R2, _, _}) when (R1 <0) or (R2 < 0) -> wrong_radius;
midCircle({R1, X1, Y1}, {R2, X2, Y2}) -> {(R1 + R2)/2, (X1 + X2) / 2, (Y1 + Y2)/2}.

% 2)
% Function isOlder that takes two dates (each date is a 3-int tuple dd, mm, yyyy) and evaluates to true or false. 
% It evaluates to true if the first argument is a date that comes before the second argument (e.g. 30/3/2012 
% comes before 1/4/2012, hence a person born on 30/3/2012 is older). (If two dates are the same, the result is 
% false.). Assume the user of your function will enter valid input.
isOlder({_, _, Y1}, {_, _, Y2}) when (Y1 < Y2) -> true; 
isOlder({_, _, Y1}, {_, _, Y2}) when (Y1 > Y2) -> false; 
isOlder({_, M1, Y1}, {_, M2, Y2}) when (Y1 == Y2) and (M1 < M2) -> true; 
isOlder({_, M1, Y1}, {_, M2, Y2}) when (Y1 == Y2) and (M1 > M2) -> false;
isOlder({D1, M1, Y1}, {D2, M2, Y2}) when (Y1 == Y2) and (M1 == M2) and (D1 < D2) -> true;  
isOlder({D1, M1, Y1}, {D2, M2, Y2}) when (Y1 == Y2) and (M1 == M2) and (D1 >= D2) -> false.

% 3
% Function modEach that takes two arguments: a list and a numerical value, and returns the new list 
% constructed by applying the second argument as a modulus operand on each list element. For example, if 
% the original list contains [4, 9, -13] and the second argument to the function is 4, then the resulting list will 
% contain [0, 1, -1]
modEach([], _) -> [];
modEach([H | T], N) -> [H rem N | modEach(T, N)].

% 4 
% Function removeMods that takes two arguments: a list and a numerical value, and returns the new list 
% constructed by removing all original list elements for which the result of applying the incoming second 
% argument as the modulus operand results in a zero. For example, if the original list contains [2, 3, 6], and the 
% second argument is 2, then [3] is returned. 
isZero(H, N) when (H rem N /= 0) -> H rem N.

removeMods([], _) -> [];
removeMods([H | T], N) when (H rem N /= 0) ->
    [ H | removeMods(T, N)];
removeMods([H | T], N) when (H rem N == 0) -> 
    removeMods(T, N).

% 5
% Function calculateSugar that takes a list of tuples, where each tuple is of the form food, grams, sugar_ratio, 
% and returns a list of tuples, where each tuple is of the form food, grams, sugar_grams where sugar_grams = 
% grams * sugar_ratio For example, if a tuple in a list comes in as {apple, 100, 0.1}, then it goes into a new list 
% as {apple, 100, 10.0} because 100g of an apple contain 10g of sugar.
calculateSugar([]) -> [];
calculateSugar([H | T]) -> 
    {Food, Grams, Sugar_ratio} = H,
    [{Food, Grams, Grams * Sugar_ratio} | calculateSugar(T)].

% 6
% Function generate – takes three ints as arguments and generates a list of integers from arg1 to arg2 
% (inclusive) in increments indicated by arg3, e .g. if arg1 = 3, arg2 = 8, and arg 3 = 2, then the function returns 
% [3, 5, 7]. 
generate(N1, N2, _) when (N1 > N2) -> [];
generate(N1, N2, N3) when (N1 =< N2) and (N3 > 0) -> 
    [N1] ++ generate(N1 + N3, N2, N3);
generate(N1, N2, N3) when (N1 =< N2) and (N3 =< 0) -> 
    arg3_should_bigger_than_zero.

%7
% Function myMax that takes a list and returns its maximum value – return an atom empty_list if a list is 
% empty. 
isMax(X, Y) when X >= Y -> X;
isMax(X, Y) when X < Y -> Y.

myMax([]) -> empty_list;
myMax([H | T]) -> myMax(H, T).
myMax(X, []) -> X;
myMax(X, [H | T]) -> myMax(isMax(X, H) , T).


%8 
% Function getnth that takes a list and an int n and returns the nth element of the list, where the head of the 
% list is the 1st element. If the list is empty, return a tuple: {error, no_such_element} 
%getnth([H | _], 1) -> H;
%getnth([], _) -> {error, no_such_element};
%getnth([_ | T], N) -> getnth(T, N-1).

getnth([], _) -> {error, no_such_element};
getnth([H | T], N) -> getnth([H | T], N, 1).
getnth([], _, _) -> {error, no_such_element};
getnth([H | _], 1, _) -> H;
getnth([_ | T], N, Acc) -> getnth(T, N-1, N+Acc).
