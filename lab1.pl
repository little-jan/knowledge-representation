:- initialization(main).

main :- write('Hello World').  % print line

% syntax for facts
human(kyle).
loves_to_eat(poopy, farty).
of_colour(yellow).
loves_to_play(cs).

% 'if' statement (; = disjunction)
bored(kyle) :- plays(cs);does(sleep).