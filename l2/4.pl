right(X, L) :-
    nth0(I0, L, X),
    nth0(I1, L, X),
    I0 < I1,
    Low is X - 1,
    High is 2 * Low,
    between(Low, High, I0),
    (I1 - I0) mod 2 =:= 1.

alright(1, L) :-
    right(1, L).
alright(N, L) :-
    M is N - 1,
    right(N, L),
    alright(M, L).

lista(N, L) :-
    M is N * 2,
    length(L, M),    
    alright(N, L).