% ===== RELATIONSHIPS IN PROLOG: (my family) =====

% parent(x, y) = x is the parent of y
parent(simon, janelle).
parent(joey, janelle).

parent(simon, shelby).
parent(joey, shelby).

parent(simon, xabriel).
parent(joey, xabriel).


% gender(x) = x is [gender]
male(simon).
male(xabriel).
female(joey).
female(janelle).
female(shelby).

% relationships:
married(X, Y) :- parent(X, Z), parent(Y, Z), X \== Y.
sisters(X, Y) :- female(X), female(Y), parent(Z, X), parent(Z, Y), X \== Y.
siblings(X, Y) :- parent(Z, X), parent(Z, Y), X \== Y.



% ===== DATA OBJECTS =====

% atoms: a variation of constants, can be any names or objects
egg.
tomato.
chilli.
tofu.
curry_rice.
'Quote Characters'.  % can include spaces 

% prolog variable definition:
% starts with an uppercase character or an underscore
% anonymous variable definition is just an underscore



% ===== LOOPS AND DECISION MAKING =====

count(50) :-
write(50), nl.
count(X) :-
write(X), nl, Y is X + 1, count(Y).

% if statement:
a(X, Y) :- X < Y,
write('X is smaller').

% if elif statement:
ab(X, Y) :- X =:= Y,
write('X and Y are the same').
ab(X, Y) :- X < Y,
write('X is smaller').



% ===== QUESTION 2: RECURSIVE ARITHMETIC =====

zero.
is_number(zero).
is_number(next(X)) :- is_number(X).

sum(zero, Y, Y).
sum(next(X), Y, next(Z)) :-
    sum(X, Y, Z).

mult(zero, _, zero).
mult(next(X), Y, Z) :-
    mult(X, Y, W),
    sum(W, Y, Z).

equals(zero, zero).
equals(next(X), next(Y)) :-
    equals(X, Y).

less_than(zero, next(_)).
less_than(next(X), next(Y)) :-
    less_than(X, Y).