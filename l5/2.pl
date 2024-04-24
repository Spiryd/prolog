main(X):-
    hetmany(_,X),
    board(X).

board(X):-
    length(X,L),
    rysuj(X,1,L).

% główna petla do rysowania
% Tablica hetmanów,aktualna kolumna, rozmiar tablicy
rysuj(_,Nk,Roz):-
    Nk > Roz,
    rysuj_przerywana(Roz),
    nl,
    !.
rysuj(Tab,Nk,Roz):-
    rysuj_przerywana(Roz),
    Y is Roz - Nk +1,
    rysuj_linie(1,Y,Tab,Roz),
    rysuj_linie(1,Y,Tab,Roz),
    Nk1 is Nk +1,
    rysuj(Tab,Nk1,Roz),
    !.
% numer wiersza,numer kolumny-rozmiar+1, tablica hetmanow,rozmiar
% tablicy
rysuj_linie(Nw,_,_,Roz):-
    Roz + 1 =:= Nw,
    write('|'),
    nl,
    !.
rysuj_linie(Nw,Nk,Tab,Roz):-
    nth1(Nw,Tab,Nk),
    (   ((Nw mod 2 =:= 0, Nk mod 2 =:= 1)
        ;(Nw mod 2 =:= 1, Nk mod 2 =:= 0)
        ) -> write('|:###:') ; write('| ### ')
    ),
    Nw1 is Nw + 1,
    rysuj_linie(Nw1,Nk,Tab,Roz),
    !.
rysuj_linie(Nw,Nk,Tab,Roz):-
    (   ((Nw mod 2 =:= 0, Nk mod 2 =:= 1)
        ;(Nw mod 2 =:= 1, Nk mod 2 =:= 0)
        ) -> write('|:::::') ; write('|     ')
    ),
    Nw1 is Nw + 1,
    rysuj_linie(Nw1,Nk,Tab,Roz),
    !.



% rysuje +-----+-----+-----+-----+-----+
rysuj_przerywana(0):-
    write('+'),
    nl,
    !.
rysuj_przerywana(Rozmiar):-
    write('+-----'),
    R is Rozmiar -1,
    rysuj_przerywana(R).

% kod na hetmany z listy 4
hetmany(N, P):-
    between(1, 100, N),
    numlist(1, N, L),
    permutation(L,P),

    dobra(P).

dobra(P) :-
    \+ zla(P).

zla(P) :-
    append(_, [Wi | L1], P),
    append(L2, [Wj | _ ], L1),
    length(L2, K),
    abs(Wi - Wj) =:= K + 1.