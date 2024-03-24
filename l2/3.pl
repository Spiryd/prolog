arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osiągalny(X, Y) :-  X = Y; osiągalny(X, Y, [X]) .
osiągalny(X, Y, Visited) :- arc(X, Y), \+ member(Y, Visited).
osiągalny(X, Y, Visited) :- 
    arc(X, Z), 
    \+ member(Z, Visited),
    osiągalny(Z, Y, [Z|Visited]).
