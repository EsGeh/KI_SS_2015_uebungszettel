

human(X) :- male(X); female(X).

% -------------------------------
% persons:
% -------------------------------
% siblings start with the same letter

female(alice) .
male(bob) .

%
female(apfelsina) .
male(apfelsinus) .

%-----

female(claire) .
male(dennis) .

female(eva) .
male(felix) .

%-----

female(gerda) .
male(hans) .

female(irmela) .
male(jens) .

female(kordula) .
male(l) .

female(magenta) .
male(niemand) .

%-----

female(orangina) .
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
mother(X,Y) :- parent(X,Y), female(X) .

% parent, child
son(X,Y) :- parent(X,Y), male(Y) .
daughter(X,Y) :- parent(X,Y), female(Y) .

% (symmetric)
sibling(X,Y) :- father(Z,X), father(Z,Y) .
sibling(X,Y) :- mother(Z,X), mother(Z,Y) .
%sibling(X,Y) :- parent(Z,X), parent(Z,Y) .

% X is the brother/sister of Y
brother(X,Y) :- sibling(X,Y), male(X) .
sister(X,Y) :- sibling(X,Y), female(X) .

% X is the grandfather of Y
grandfather(X,Y) :- parent(X,Z), parent(Z,Y), male(X) .
grandmother(X,Y) :- parent(X,Z), parent(Z,Y), female(X) .

% predecessor, successor
predecessor(X,Y) :- parent(X,Y) .
predecessor(X,Y) :- parent(X, Z), predecessor(Z,Y) .

% successor, predecessor
successor(X,Y) :- predecessor(Y,X) .
