% a.

myLast([LastItem | []], LastItem).
myLast([_ | List], LastItem) :- myLast(List, LastItem).

% b.

myMax(ListOfNumbers, MaxItem)
  :- member(MaxItem, ListOfNumbers), mySchranke(ListOfNumbers, MaxItem).

mySchranke([Number | ListOfNumbers], MaxItem)
  :- MaxItem >= Number, mySchranke(ListOfNumbers, MaxItem).

mySchranke([], _).

% c.

mySum([], 0).
mySum([Number | ListOfNumbers], SumList)
  :- mySum(ListOfNumbers, NewSum), SumList is NewSum + Number.

% d.

myOrdered(ListOfNumbers) :- myOrderedUp(ListOfNumbers).
myOrdered(ListOfNumbers) :- myOrderedDown(ListOfNumbers).

myOrderedDown([Number1 | [Number2 | ListOfNumbers]])
  :- Number1 >= Number2, myOrderedDown([Number2 | ListOfNumbers]).

myOrderedDown([_]).

myOrderedUp([Number1 | [Number2 | ListOfNumbers]])
  :- Number2 >= Number1, myOrderedUp([Number2 | ListOfNumbers]).

myOrderedUp([_]).
