zero.
is_number(zero).

is_number(f(X)) :- is_number(X).

% modulo 3
modulus(f(f(f(zero)))).

equals(zero, zero).
equals(X, zero) :- modulus(X).
equals(zero, X) :- modulus(X).
equals(f(X), f(Y)) :- equals(X, Y)

sum(zero, zero, equals())