

human(X) :- male(X); fem(X).

% -------------------------------
% persons:
% -------------------------------
% siblings start with the same letter


%-----
% alice and bob are a couple:
fem(alice) .
	% siblings of alice
	fem(apfelsina) . 
	male(apfelsinus) .
male(bob) .

%-----
% alice and bobs parents:

fem(claire) .
male(dennis) .

fem(eva) .
male(felix) .

%-----
% alice and bobs grandparents:

fem(gerda) .
male(hans) .

fem(irmela) .
male(jens) .

fem(kordula) .
male(l) .

fem(magenta) .
male(niemand) .

%----
% additional persons for testing:

fem(orangina) .
male(penis) .

% mother, father, child
created(claire, dennis, alice) .
	% siblings of alice:
	created(claire, dennis, apfelsina) .
	created(claire, dennis, apfelsinus) .
  created(claire, niemand,orangina) .
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

sibling(X,Y) :-
	created(W,Z,X), created(W,Z,Y) .

half_sibling(X,Y) :-
	created(Mother, Father1, X), created(Mother, Father2, Y), Father1 \= Father2;
	created(Mother1, Father, X), created(Mother2, Father, Y), Mother1 \= Mother2 .

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
