triangle(Side1, _, _, _) :- Side1 =< 0, !, fail.
triangle(_, Side2, _, _) :- Side2 =< 0, !, fail.
triangle(_, _, Side3, _) :- Side3 =< 0, !, fail.

triangle(Side1, Side2, Side3, _) :- Side1 + Side2 =< Side3, !, fail.
triangle(Side1, Side2, Side3, _) :- Side2 + Side3 =< Side1, !, fail.
triangle(Side1, Side2, Side3, _) :- Side1 + Side3 =< Side2, !, fail.

triangle(Side, Side, Side, "equilateral") :- !.

triangle(Side, Side, _, "isosceles") :- !.
triangle(Side, _, Side, "isosceles") :- !.
triangle(_, Side, Side, "isosceles") :- !.

triangle(Side1, Side2, Side3, "scalene") :-
    Side1 =\= Side2,
    Side2 =\= Side3,
    Side1 =\= Side3.
