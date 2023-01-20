factorial(0, 1) :- !.
factorial(N, F) :-
    N > 0,
    N1 is N-1,
    factorial(N1, F1),
    F is N*F1.

a(N, R, Value) :-
    factorial(N, Numerator),
    factorial(R, Denominator1),
    Difference is N - R,
    factorial(Difference, Denominator2),
    Value is Numerator / (Denominator1 * Denominator2).

row(N, Row) :-
    numlist(0, N, Columns),
    maplist(a(N), Columns, Row).

pascal(0, []) :- !.
pascal(N, Triangle) :-
    End is N - 1,
    numlist(0, End, Rows),
    maplist(row, Rows, Triangle).
