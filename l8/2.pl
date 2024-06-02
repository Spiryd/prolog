:- use_module(library(clpfd)).

plecak(Wartosc, Wielkosc, Pojemnosc, Zmienne):-
    length(Wartosc,L),
    length(Zmienne,L),
    Zmienne ins 0..1,
    scalar_product(Wartosc,Zmienne, #= ,Cel),
    scalar_product(Wielkosc, Zmienne, #=<, Pojemnosc),
    once(labeling([max(Cel)], Zmienne)).