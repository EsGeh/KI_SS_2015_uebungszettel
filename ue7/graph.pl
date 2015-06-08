% 1. a.

% ungerichtet
ucon(A,B) :- con(A,B).
ucon(A,B) :- con(B,A).

% eigentlicher Graph
con(a,b).
con(a,c).
con(b,d).
con(b,e).
con(c,d).
con(c,e).
con(d,e).

% b.
notmember(X,L) :- member(X,L),!,fail; true.
path_schleifenfrei(X,Y,[X,Y],_) :- ucon(X,Y).
path_schleifenfrei(X,Y,[X|P],V) :-
  ucon(X,Z),
  notmember(Z,V),
  path_schleifenfrei(Z,Y,P,[Z|V]).
path(X,Y,P) :- path_schleifenfrei(X,Y,P,[X,Y]).

% c.
allPaths(X,Y,L) :- findall(P, path(X,Y,P), L).

% d.
laenger(P,L)   :- member(P_,L), length(P_,L2), length(P,L1), L1 < L2, !,fail; true.
maxPath(X,Y,P) :- path(X,Y,P), allPaths(X,Y,L), laenger(P,L).

% 2.
quicksort([P|Liste],SortierteListe) :-
  partition(Liste,Left,P,Right),
  quicksort(Left,Lsortiert),
  quicksort(Right,Rsortiert),
  append(Lsortiert,[P|Rsortiert],SortierteListe).
quicksort([],[]).

partition([X|Liste],[X|Ls],P,Rs) :-
  X =< P, !, partition(Liste,Ls,P,Rs).
partition([X|Liste],Ls,P,[X|Rs]) :-
  X >  P, !, partition(Liste,Ls,P,Rs).
partition([],[],_,[]).

% 3.
%board(1,2,3,4,5,6,7,8,9,b).

%b.
move(board(X1,X2,X3,X4,X5,X6,X7,X8,X9), board(Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9))
 :- L1 = [X1,X2,X3,X4,X5,X6,X7,X8,X9], 
    L2 = [Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9],
    nth0(I1, L1, b, R1), nth0(I2, L1, M),
    nth0(I2, L2, b), nth0(I1, L2, M, R2),
    select(M, R1, b, R2),
    specialRule(I1,I2).

specialRuleH(I,V) :- I // 3 =:= V // 3, I =:= (V+1).
specialRuleH(I,V) :- I // 3 =:= V // 3, I+1 =:= V.
specialRule(I,V) :- specialRuleH(I,V).
specialRule(I,V) :- specialRuleH(I // 3, V // 3), mod(I,3) =:= mod(V,3).

% 5 Regeln sind weniger als 8!
