:- consult("../l5/1.pl").

program([H|R]) -->
    instrukcja(H),
    [sep(;)],
    !,
    program(R).

 program([]) -->
    [].


instrukcja(assign(X, Y)) -->
    [id(X)],
    [sep(:=)],
    wyrazenie(Y).

instrukcja(read(X)) -->
    [key(read)],
    [id(X)].

instrukcja(write(Y)) -->
    [key(write)],
    wyrazenie(Y).

instrukcja(if(X, Y)) -->
    [key(if)],
    warunek(X),
    [key(then)],
    program(Y),
    [key(fi)].

instrukcja(if(X, Y, Z)) -->
    [key(if)],
    warunek(X),
    [key(then)],
    program(Y),
    [key(else)],
    program(Z),
    [key(fi)].

instrukcja(while(X, Y)) -->
    [key(while)],
    warunek(X),
    [key(do)],
    program(Y),
    [key(od)].


wyrazenie(X + Y) -->
    skladnik(X),
    [sep(+)],
    wyrazenie(Y).

wyrazenie(X - Y) -->
    skladnik(X),
    [sep(-)],
    wyrazenie(Y).

wyrazenie(X) -->
    skladnik(X).


skladnik(X * Y) -->
    czynnik(X),
    [sep(*)],
    skladnik(Y).

skladnik(X / Y) -->
    czynnik(X),
    [sep(/)],
    skladnik(Y).

skladnik(X mod Y) -->
    czynnik(X),
    [key(mod)],
    skladnik(Y).

skladnik(X) -->
    czynnik(X).


czynnik(id(X)) -->
    [id(X)].

czynnik(int(X)) -->
    [int(X)].

czynnik(( X )) -->
    [sep('(')],
    wyrazenie(X),
    [sep(')')].


warunek((X ; Y)) -->
    koniunkcja(X),
    [key(or)],
    warunek(Y).

warunek(X) -->
    koniunkcja(X).


koniunkcja((X , Y)) -->
    prosty(X),
    [key(and)],
    koniunkcja(Y).

koniunkcja(X) -->
    prosty(X).


prosty(X =:= Y) -->
    wyrazenie(X),
    [sep(=)],
    wyrazenie(Y).

prosty(X =\= Y) -->
    wyrazenie(X),
    [sep(/=)],
    wyrazenie(Y).

prosty(X < Y) -->
    wyrazenie(X),
    [sep(<)],
    wyrazenie(Y).

prosty(X > Y) -->
    wyrazenie(X),
    [sep(>)],
    wyrazenie(Y).

prosty(X >= Y) -->
    wyrazenie(X),
    [sep(>=)],
    wyrazenie(Y).

prosty(X =< Y) -->
    wyrazenie(X),
    [sep(=<)],
    wyrazenie(Y).

prosty(( X )) -->
    [sep('(')],
    warunek(X),
    [sep(')')].
    