create((DimX, DimY)) :- between(0, 7, DimX), between(0, 7, DimY).

% same column
attack((X, _), (X, _)) :- !.

% same row
attack((_, Y), (_, Y)) :- !.

% share diagonal
attack((FromX, FromY), (ToX, ToY)):- abs(FromX - ToX) =:= abs(FromY - ToY).
