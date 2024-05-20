% akceptacja a^n b^n, gdzie n >= 0

g1 --> ``.
g1 --> `a`, g1,`b`.

% akceptacja a^n b^n c^n gdzie n >=0
g2 --> counter(X,`a`),counter(X,`b`),counter(X,`c`).

% wykorzystuje s jako licznik, czyli 0, s(0), s(s(0)) itd.
counter(0,_) --> ``.

counter(s(X),L) -->
    counter(X,L),
    L.

% akceptacja a^n b^(fib(n))
g3 --> counter(X,`a`),fibCounter(X,`b`).

fibCounter(0,_) --> ``.

fibCounter(s(0),L) --> L.

fibCounter(s(s(X)),L) --> fibCounter(X,L), fibCounter(s(X),L).


% phrase(p(X),Y,Z) daje ten sam rezultat co append(X,Y,Z).
p([]) --> [].
p([X | Xs]) --> [X], p(Xs).
