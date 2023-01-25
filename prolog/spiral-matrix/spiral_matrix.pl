spiral(0, []) :- !.
spiral(Size, Matrix) :-
    Count is Size^2,
    numlist(1, Count, Numbers),
    spiral_coordinates(Size, Coordinates),
    zip(Coordinates, Numbers, Zipped),
    msort(Zipped, Sorted),
    zip(_, Sequence, Sorted),
    divide(Sequence, Size, Matrix).

spiral_coordinates(Size, Coordinates) :-
    findall(Layer, layer(Size, Layer), Layers),
    maplist(layer_coordinates(Size), Layers, Coords),
    flatten(Coords, Coordinates).

layer(Size, Layer) :-
    Layers is floor((Size + 1) / 2) - 1,
    between(0, Layers, Layer).

layer_coordinates(Size, Layer, Coordinates) :-
    top(Size, Layer, T),
    right(Size, Layer, R),
    bottom(Size, Layer, B),
    left(Size, Layer, L),
    flatten([T, R, B, L], Coordinates).

column(Y, X, Coordinate) :- Coordinate = (Y, X).
row(X, Y, Coordinate) :- Coordinate = (Y, X).

top(Size, Layer, Coordinates) :-
    Row is Layer,
    Width is (Size - Layer) - 1,
    Start is Layer,
    End is Width,
    numlist(Start, End, Columns),
    maplist(column(Row), Columns, Coordinates).

right(Size, Layer, Coordinates) :-
    Column is Size - Layer - 1,
    Height is (Size - Layer) - 1,
    Start is Layer + 1,
    End is Height,
    (Start =< End -> numlist(Start, End, Rows); Rows = []),
    maplist(row(Column), Rows, Coordinates).

bottom(Size, Layer, Coordinates) :-
    Row is Size - Layer - 1,
    Width is (Size - Layer) - 1,
    Start is Layer,
    End is Width - 1,
    (Start =< End -> numlist(Start, End, Columns); Columns = []),
    reverse(Columns, Reversed),
    maplist(column(Row), Reversed, Coordinates).

left(Size, Layer, Coordinates) :-
    Column is Layer,
    Height is (Size - Layer) - 1,
    Start is Height - 1,
    End is Layer + 1,
    (End =< Start -> numlist(End, Start, Rows); Rows = []),
    reverse(Rows, Reversed),
    maplist(row(Column), Reversed, Coordinates).

% Adapted from https://stackoverflow.com/questions/22855251/prolog-zip-function
zip([], [], []).
zip([X|Xs], [Y|Ys], [(X,Y)|Zs]) :- zip(Xs,Ys,Zs).

% Adapted from https://stackoverflow.com/questions/34997923/prolog-split-a-list-into-a-list-of-n-lists-containing-n-items-each
divide([], _, []) :- !.
divide(List, Size, [Chunk|Rest]) :-
   length(Chunk, Size),
   append(Chunk, ListTail, List),
   divide(ListTail, Size, Rest).
