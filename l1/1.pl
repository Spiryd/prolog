jest_matką(X) :- matka(X, _).
jest_ojcem(X) :- ojciec(X, _).
jest_synem(X) :- mezczyzna(X), rodzic(_, X).
siostra(X, Y) :- kobieta(X), rodzic(Z, X), rodzic(Z, Y), X \= Y.
dziadek(X, Y) :- mezczyzna(X), rodzic(X, Z), rodzic(Z, Y).
rodzenstwo(X, Y) :- rodzic(Z, X), rodzic(Z, Y), X \= Y.
