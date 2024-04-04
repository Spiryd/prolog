count_inversions([], 0).
count_inversions([H|T], Count) :-
    findall(X, (member(X, T), X < H), L),
    length(L, C),
    count_inversions(T, C1),
    Count is C + C1.

even_permutation(Xs, Ys) :-
    permutation(Xs, Ys),
    count_inversions(Ys, Count),
    0 is Count mod 2.

odd_permutation(Xs, Ys) :-
    permutation(Xs, Ys),
    count_inversions(Ys, Count),
    1 is Count mod 2.
