fof(a1, axiom,
  ! [X] : (
     ( wolve(X) | fox(X) | bird(X) | caterpillar(X) | snail(X) ) => animal(X)
  )
).

fof(a2a, axiom, ? [X] : ( wolve(X) ) ).
fof(a2b, axiom, ? [X] : ( fox(X) ) ).
fof(a2c, axiom, ? [X] : ( bird(X) ) ).
fof(a2d, axiom, ? [X] : ( caterpillar(X) ) ).
fof(a2e, axiom, ? [X] : ( snail(X) ) ).

fof(a3, axiom, ? [X] : ( grain(X) ) ).

fof(a4, axiom, ! [X] : ( grain(X) => plant(X) ) ).

fof(a5helper, axiom,
  ! [X] : (
     eats_some_plants(X)
       <=> 
     ( ? [P] : ( plant(P) & eats(X,P) ) ) 
  )
).

fof(a5, axiom,
  ! [X] : (
     ( animal(X) ) => 
       ( ( ![P] : ( plant(P) => eats(X,P) ) )
       | ( ![Y] : (
             ( animal(Y) & eats_some_plants(Y) & is_much_smaller(Y,X) ) 
               => eats(X,Y)
           )
         )
       )
  )
).

% modus ponens
fof(a6, axiom,
  ! [X,Y,Z] : (
     ( is_much_smaller(X,Y) & is_much_smaller(Y,Z) )
         =>  is_much_smaller(X,Z)
  )
).

fof(a6a, axiom,
  ! [X,Y] : (
     ( (caterpillar(X) | snail(X)) & bird(Y) )
         => is_much_smaller(X,Y)
  )
).

fof(a6b, axiom,
  ! [X,Y] : (
     ( bird(X) & fox(Y) )
       => is_much_smaller(X,Y)
  )
).

fof(a6c, axiom,
  ! [X,Y] : (
     ( fox(X) & wolve(Y) )
       => is_much_smaller(X,Y)
  )
).

fof(a7, axiom,
  ! [X,Y] : (
     ( wolve(X) & ( fox(Y) | grain(Y) ) )
       => ( ~eats(X,Y) )
  )
).

fof(a8, axiom,
  ! [X,Y] : (
     ( bird(X) & caterpillar(Y) )
       => eats(X,Y)
  )
).

fof(a8a, axiom,
  ! [X,Y] : (
     ( bird(X) & snail(Y) )
       => ( ~ eats(X,Y) )
  )
).

fof(a9, axiom,
  ! [X] : (
     ( caterpillar(X) | snail(X) )
       => eats_some_plants(X)
  )
).

fof(c, conjecture,
  ? [X,Y,G] : (
    animal(X) & animal(Y) & grain(G) & eats(X,Y) & eats(Y,G)
  )
).
