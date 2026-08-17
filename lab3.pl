https://www.tutorialspoint.com/prolog/prolog_arithmetic_operators.htm

animal(dog).
animal(cat).
animal(elephant).
animal(tiger).
animal(cobra).
animal(python).
snake(cobra).
snake(python).
likes(mary, X) :- snake(X), !, fail.  % prevents backtracking, stops mary from liking a snake
likes(mary, X) :- animal(X).


% using cuts makes the program faster/more efficient
% used when rule are mutually exclusive

f(X,0) :- X < 3, !.
f(X,2) :- 3 =< X, X < 6, !.
f(X,4) :- 6 =< X.


% below is the same

different(X, X) :- !, fail.
different(X, Y).

different(X, Y) :- X = Y, !, fail ; true. 

different(X, X) :- !, fail.different(X, Y).



not(P) :- P, !, fail ; true.