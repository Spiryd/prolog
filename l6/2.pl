:- consult("1.pl").

% podstaw(+Stare, +ID, +Wartosc, -Nowe)
podstaw([], ID, N, [ID = N]).
podstaw([ID=_ | AS], ID, N, [ID=N | AS]) :-
    !.
podstaw([ID1=W1 | AS1], ID, N, [ID1=W1 | AS2]) :-
    podstaw(AS1, ID, N, AS2).

% pobierz(+Asocjacje, +ID, -Wartosc)
pobierz([ID=N | _], ID, N) :-
    !.
pobierz([_ | AS], ID, N) :-
    pobierz(AS, ID, N).

% wartosc(+Wyrazenie, +Asocjacje, -Wartosc)
wartosc(int(N), _,N).
wartosc(id(ID), AS, N) :-
    pobierz(AS, ID, N).
wartosc(W1 + W2, AS, N) :-
    wartosc(W1, AS, N1),
    wartosc(W2, AS, N2),
    N is N1 + N2.
wartosc(W1 -W2, AS, N) :-
    wartosc(W1, AS, N1),
    wartosc(W2, AS, N2),
    N is N1 - N2.
wartosc(W1 * W2, AS, N) :-
    wartosc(W1, AS, N1),
    wartosc(W2, AS, N2),
    N is N1 * N2.
wartosc(W1 / W2, AS, N) :-
    wartosc(W1, AS, N1),
    wartosc(W2, AS, N2),N2 =\= 0,
    N is N1 div N2.
wartosc(W1 mod W2, AS, N) :-
    wartosc(W1, AS, N1),
    wartosc(W2, AS, N2),
    N2 =\= 0,
    N is N1 mod N2.

% prawda(+Warunek, +Asocjacje)
prawda(W1 =:= W2, AS) :-
    wartosc(W1, AS, N1),
    wartosc(W2, AS, N2),
    N1 =:= N2.
prawda(W1 =\= W2, AS) :-
    wartosc(W1, AS, N1),
    wartosc(W2, AS, N2),
    N1 =\= N2.
prawda(W1 < W2, AS) :-
    wartosc(W1, AS, N1),
    wartosc(W2, AS, N2),
    N1 < N2.
prawda(W1 > W2, AS) :-
    wartosc(W1, AS, N1),
    wartosc(W2, AS, N2),
    N1 > N2.
prawda(W1 >= W2, AS) :-
    wartosc(W1, AS, N1),
    wartosc(W2, AS, N2),
    N1 >= N2.
prawda(W1 =< W2, AS) :-
    wartosc(W1, AS, N1),
    wartosc(W2, AS, N2),
    N1 =< N2.
prawda((W1, W2), AS) :-
    prawda(W1, AS),
    prawda(W2, AS).
prawda((W1; W2), AS) :-
    (   prawda(W1, AS),
    !
    ;   prawda(W2, AS)).

% interpreter(+Program, +Asocjacje)
interpreter([], _).
interpreter([read(ID) | PGM], ASSOC) :-
    !,
    read(N),
    integer(N),
    podstaw(ASSOC, ID, N, ASSOC1),
    interpreter(PGM, ASSOC1).
interpreter([write(W) | PGM], ASSOC) :-
    !,
    wartosc(W, ASSOC, WART),
    write(WART),
    nl,
    interpreter(PGM, ASSOC).
interpreter([assign(ID, W) | PGM], ASSOC) :-
    !,
    wartosc(W, ASSOC, WAR),
    podstaw(ASSOC, ID, WAR, ASSOC1),
    interpreter(PGM, ASSOC1).
interpreter([if(C, P) | PGM], ASSOC) :- !,
    interpreter([if(C, P, []) | PGM], ASSOC).
interpreter([if(C, P1, P2) | PGM], ASSOC) :-
    !,
    (   prawda(C, ASSOC)->  append(P1, PGM, DALEJ)
    ;   append(P2, PGM, DALEJ)
    ),
    interpreter(DALEJ, ASSOC).
interpreter([while(C, P) | PGM], ASSOC) :-
    !,
    append(P, [while(C, P)], DALEJ),
    interpreter([if(C, DALEJ) | PGM], ASSOC).

% interpreter(+Program)
    interpreter(PROGRAM) :-interpreter(PROGRAM, []).


wykonaj(NazwaPliku):-
    open(NazwaPliku,read,X),
    scanner(X,Y),
    close(X),
    phrase(program(Z), Y),
    interpreter(Z).
