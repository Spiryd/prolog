:- use_module(library(clpfd)).

odcinek1(X):-
    length(X,16),
    X ins 0..1,
    sum(X, #=, 8),
    append(_,W,X),
    append([1,1,1,1,1,1,1,1],_,W).

to_number([X15,X14,X13,X12,X11,X10,X9,X8,X7,X6,X5,X4,X3,X2,X1,X0],Value):-
    Value #= 32768*X15 + 16384*X14 + 8192*X13 + 4096*X12 + 2048*X11 + 1024*X10 + 512*X9 + 256*X8 + 128*X7 + 64*X6 + 32*X5 + 16*X4 + 8*X3 + 4*X2 + 2*X1 + X0.

odcinek2(X):-
    length(X,16),
    X ins 0..1,
    sum(X, #=, 8),
    to_number(X,Wartosc),
    8 #= popcount(Wartosc),
    7 #= msb(Wartosc) -lsb(Wartosc).

% chyba o to chodzilo
odcinek(X):-
    length(X,16),
    length(X1,8),
    X ins 0..1,
    sum(X, #=, 8),
    append(X1,X2,X),
    chain(X1, #=<),
    chain(X2, #>=).