above(Block1, Block2) :- on(Block1, Block2).
above(Block1, Block2) :- on(Block1, Block3), above(Block3, Block2).

on(a, b).
on(b, c).
on(c, d).
on(d, e).
