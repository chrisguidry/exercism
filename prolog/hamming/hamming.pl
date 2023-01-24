hamming_distance(Str1, Str2, Dist) :-
    string_chars(Str1, Chars1),
    string_chars(Str2, Chars2),
    distance(Chars1, Chars2, Dist).

distance([], [], 0).
distance([Head1|Tail1], [Head2|Tail2], Distance) :-
    (Head1 = Head2 -> D is 0; D is 1),
    distance(Tail1, Tail2, Remaining),
    Distance is D + Remaining.
