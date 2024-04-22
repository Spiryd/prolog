dobra(X) :-
    \+ zła(X).
% z≥a(X) zachodzi, gdy wsród hetmanów ustawionych
% zgodnie z permutacjπ X sπ dwa które siÍ bijπ
zła(X) :-
    append(_, [Wi | L1], X),
    append(L2, [Wj | _], L1),
    length(L2, K),
    abs(Wi - Wj) =:= K + 1.
% abs(Wi - Wj) = odleg≥oúÊ hetmanów w pionie
% K + 1 = odleg≥oúÊ hetmanów w poziomie

hetmany(N, P) :-
    numlist(1, N, L), % stworzenie listy liczb 1 .. N
    permutation(L, P),
    dobra(P).
