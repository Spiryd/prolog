g1 --> ``.
g1 --> `a`, g1,`b`.

g2 --> counter(X,`a`),counter(X,`b`),counter(X,`c`).

counter(0,_) --> ``.
counter(s(X),L) -->
    counter(X,L),
    L.


g3 --> counter(X,`a`),fibCounter(X,`b`).

fibCounter(0,_) --> ``.
fibCounter(s(0),L) --> L.
fibCounter(s(s(X)),L) --> fibCounter(X,L), fibCounter(s(X),L).

p([]) --> [].
p([X | Xs]) --> [X], p(Xs).
