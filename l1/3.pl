is_prime(2) :-
    !.
is_prime(3) :-
    !.
is_prime(X) :-
    X > 3,
    X mod 2 =\= 0,
    is_prime_(X, 3).

is_prime_(X, N) :-
    (  N*N > X
    -> true
    ;  X mod N =\= 0,
       M is N + 2,
       is_prime_(X, M)
    ).
prime(LO, HI, N) :-
    between(LO, HI, N),
    is_prime(N).