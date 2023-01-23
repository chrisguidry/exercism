can_chain([]) :- !.
can_chain([(X,X)]) :- !.
can_chain(Pieces) :-
    % Generate all of the permutations of flipping stones; all list like [0, 1, 1, 0]
    % that are the same length as Pieces, where 1 means "try flipping this stone"
    length(Pieces, Length),
    length(Flips, Length),
    maplist(between(0, 1), Flips),
    % Take all permutations of the Pieces
    permutation(Pieces, Permutation),
    % Then apply the flips
    maplist(flip_if, Flips, Permutation, WithFlips),
    % Then test if they form a proper chain
    first_links_last(WithFlips),
    is_chained(WithFlips),
    !.

flip_if(ShouldFlip, (X, Y), Result) :-
    % if ShouldFlip is 1, flip, otherwise, keep the same
    ShouldFlip = 1 -> Result = (Y, X); Result = (X, Y).

is_chained([]).
is_chained([_]).
is_chained([(_,Y)|Rest]) :-
    [(Y, _)|_] = Rest,
    is_chained(Rest).

first_links_last([(First,_)|Rest]) :-
    last(Rest, (_, Last)),
    First = Last.
