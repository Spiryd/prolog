is_prime(2).
is_prime(N) :- is_prime(N, 2).
is_prime(N, N).
is_prime(N, K) :-
    N mod K =\= 0,
    K1 is K + 1,
    is_prime(N, K1).

prime(LO, HI, N) :-
    between(LO, HI, N),
    is_prime(N).