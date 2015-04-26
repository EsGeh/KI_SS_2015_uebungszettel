fof(a1, axiom, cat(garfield) ).
fof(a2, axiom, dog(odie) ).
fof(a3, axiom,
     ! [X] : ( animal(X) <=> ( dog(X) | cat(X) ) )
).

fof(a4, axiom, human(jon) ).
fof(a5, axiom,
     ! [X] :
        ( ? [Y] :
             ( animal(X) => human_owner(Y,X) )
        )
).

fof(a6, axiom, ! [X,Y] : ( human_owner(X,Y) => human(X) ) ).

fof(a7, axiom,
  ! [X] :
     ( human_owner(jon, X) <=>
        ( X = garfield
        | X = odie )
     )
).

fof(a8, axiom,
  ! [Dog,Cat,OCat,ODog] : (
     ( dog(Dog)
     & cat(Cat)
     & chased(Cat,Dog)
     & human_owner(OCat,Cat)
     & human_owner(ODog,Dog) ) =>
         hates(OCat,ODog)
  )
).

fof(a9, axiom, chased(garfield,odie) ).
fof(c, conjecture, hates(jon ,jon ) ).
