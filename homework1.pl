connected(perth, bull_creek, perth_mandurah).
connected(bull_creek, cockburn, perth_mandurah).
connected(elizabeth_quay, canning_bridge, perth_mandurah).
connected(murdoch, aubin_grove, perth_mandurah).
connected(bull_creek, murdoch, perth_mandurah).
connected(perth, burswood, perth_armadale).
connected(cannington, beckenham, perth_armadale).
connected(kelmscott, byford, perth_armadale).
connected(victoria_park, cannington, perth_armadale).
connected(armadale, byford, perth_armadale).
connected(burswood, victoria_park, perth_armadale).
connected(beckenham, kelmscott, perth_armadale).
connected(kelmscott, armadale, perth_armadale).

closed(murdoch).


station_on_line(S, L) :- 
    connected(S, _, L); 
    connected(_, S, L).

before_on_line(S, T, L) :-
    connected(S, T, L).
before_on_line(S, T, L) :-
    connected(S, X, L),
    before_on_line(X, T, L).

terminal(S, L) :-
    connected(S, _, L), 
    \+ connected(_, S, L).
terminal(S, L) :-
    connected(_, S, L),
    \+ connected(S, _, L).

route_on_line(S, T, L, [S, T]) :-
    connected(S, T, L),
    \+ closed(S),
    \+ closed(T).

route_on_line(S, T, L, [S | Rest]) :-
    connected(S, X, L),
    \+ closed(S),
    route_on_line(X, T, L, Rest).