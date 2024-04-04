recurrence([], S, S, _).

recurrence([H|T], S, Result, Current) :-
	(Current>0 -> NewCurrent is Current + H ; NewCurrent is H),
	(NewCurrent>Result -> NewResult is NewCurrent ; NewResult is Result),
	recurrence(T, S, NewResult, NewCurrent).

max_sum([], 0).

max_sum(L, S):-
	recurrence(L, S, 0, 0).
