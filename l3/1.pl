sum([], 0).
sum([H|T], Sum) :-
   sum(T, Rest),
   Sum is H + Rest.

len([], 0).
len([_|T], N) :-
   len(T, X),
   N is X + 1.

mean(L, Mean) :-
   sum(L, Sum),
   len(L, Len),
   Len > 0,
   Mean is Sum / Len.

squared_diff([], _, []).
squared_diff([H|T], Mean, [D|Diffs]) :-
   D is (H - Mean) ** 2,
   squared_diff(T, Mean, Diffs).

variance(L, Variance) :-
   mean(L, Mean),
   squared_diff(L, Mean, Diffs),
   mean(Diffs, Variance).
