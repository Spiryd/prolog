jednokrotnie(X, L) :-
    select(X, L, Rest),
    \+ member(X, Rest).

dwukrotnie(X, L) :-
    select(X, L, Rest1),
    select(X, Rest1, Rest2),
    \+ member(X, Rest2).
