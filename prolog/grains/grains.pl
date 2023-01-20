square(SquareNumber, Value) :-
    between(1, 64, SquareNumber),
    Exponenent is SquareNumber - 1,
    Value is 2**Exponenent.

total(Value) :-
    numlist(1, 64, SquareNumbers),
    maplist(square, SquareNumbers, Squares),
    sum_list(Squares, Value).
