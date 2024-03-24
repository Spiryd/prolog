jednokrotnie(X, L) :-
    select(X, L, Rest),
    \+ member(X, Rest).

dwukrotnie(E,L) :- 
    append(B1,[E|A1],L), 
    \+ member(E,B1), 
    append(B2,[E|A2],A1), 
    \+ member(E,B2), 
    \+ member(E,A2).