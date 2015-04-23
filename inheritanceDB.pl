

human(X) :- male(X); fem(X).

% -------------------------------
% persons:
% -------------------------------
% siblings start with the same letter

fem(alice) .
male(bob) .

%
fem(apfelsina) .
male(apfelsinus) .

%-----

fem(claire) .
male(dennis) .

fem(eva) .
male(felix) .

%-----

fem(gerda) .
male(hans) .

fem(irmela) .
male(jens) .

fem(kordula) .
male(l) .

fem(magenta) .
male(niemand) .

%-----

fem(orangina) .
male(penis) .

% mother, father, child
created(claire, dennis, alice) .
	created(claire, dennis, apfelsina) .
	created(claire, dennis, apfelsinus) .
created(eva, felix, bob) .

created(gerda, hans, claire) .
created(irmela, jens, dennis) .
created(kordula, l, eva) .
created(magenta, niemand, felix) .

% parent, child
parent(X,Y) :- created(X, _, Y); created(_, X, Y) .

father(X,Y) :- parent(X,Y), male(X) .
mother(X,Y) :- parent(X,Y), fem(X) .

% parent, child
son(X,Y) :- parent(X,Y), male(Y) .
daughter(X,Y) :- parent(X,Y), fem(Y) .

% (symmetric)
sibling(X,Y) :- father(Z,X), father(Z,Y) .
sibling(X,Y) :- mother(Z,X), mother(Z,Y) .
%sibling(X,Y) :- parent(Z,X), parent(Z,Y) .

% X is the brother/sister of Y
brother(X,Y) :- sibling(X,Y), male(X) .
sister(X,Y) :- sibling(X,Y), fem(X) .

% X is the grandfather of Y
grandfather(X,Y) :- parent(X,Z), parent(Z,Y), male(X) .
grandmother(X,Y) :- parent(X,Z), parent(Z,Y), fem(X) .

% predecessor, successor
predecessor(X,Y) :- parent(X,Y) .
predecessor(X,Y) :- parent(X, Z), predecessor(Z,Y) .

% successor, predecessor
successor(X,Y) :- predecessor(Y,X) .
