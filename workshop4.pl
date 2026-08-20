check(X, Y) :- 
Y > X,
write('Y is higher than X'),
loop(Y).

check(X, Y) :- 
Y =:= X,
write('Y is equal to X').

check(X, Y) :- 
Y < X,
write('Y is lower than X'),
loop(Y).

loop(R) :- 
read(X),
check(X, R).

play :- 
random(1, 100, R),
write('this is a guessing game'),
loop(R).


bubble([], [], noswap).
bubble([X], [X], noswap).
bubble([H | [X | T]], [H | [X | T]], noswap) :-
H < X,
bubble([X | T], [X | T], noswap).
bubble([X, Y], [Y, X], swap) :- 
Y < X.
bubble([H | [X | T]], [X | Rest], swap) :-
X < H, 
bubble([X | T], Rest, _).


bsort(Xs, Ys) :- bubble(Xs, Ys, noswap).
bsort(Xs, Ys) :- 
bubble(Xs, Zs, swap),
bsort(Zs, Ys).