środkowy(List, Middle) :-
    traverse(List, List, Middle).

% Base case: when the fast pointer has reached the end of the list
traverse([Middle|_], [], Middle) :- false.
traverse([Middle|_], [_], Middle).

% Recursive case: move the slow pointer one step and the fast pointer two steps
traverse([_|Slow], [_, _|Fast], Middle) :-
    traverse(Slow, Fast, Middle).