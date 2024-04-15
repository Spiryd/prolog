wyrażenie([X], X, X).
wyrażenie(LISTA, WARTOŚĆ, WYRAŻENIE) :-
    append(L1, L2, LISTA), L1 \= [], L2 \= [],
    wyrażenie(L1, W1, WYR1), wyrażenie(L2, W2, WYR2),
    (   WARTOŚĆ is W1 + W2, WYRAŻENIE = (WYR1 + WYR2)
    ;   WARTOŚĆ is W1 - W2, WYRAŻENIE = (WYR1 - WYR2)
    ;   WARTOŚĆ is W1 * W2, WYRAŻENIE = (WYR1 * WYR2)
    ;   W2 \= 0, WARTOŚĆ is W1 / W2, WYRAŻENIE = (WYR1 / WYR2)
    ).