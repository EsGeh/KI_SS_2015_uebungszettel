
fof(a1, axiom,
    ( work_hard(you) => lucky(you) )
).

fof(a2, axiom,
    ( work_hard(you) | lucky(you) )
).

fof(a3, axiom,
    ( lucky(you) => ( rogue(you) <=> work_hard(you) ) )
).

fof(a4, axiom,
    ( rogue(you) )
).

fof(c, conjecture,
    ( work_hard(you) )
).
