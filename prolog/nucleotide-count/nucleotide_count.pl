nucleotide_count(Strand, [('A', A), ('C', C), ('G', G), ('T', T)]) :-
    string_chars(Strand, Bases),
    count(Bases, A, C, G, T).

count([], 0, 0, 0, 0).
count(['A'|Tail], A1, C, G, T) :- count(Tail, A, C, G, T), A1 is A + 1.
count(['C'|Tail], A, C1, G, T) :- count(Tail, A, C, G, T), C1 is C + 1.
count(['G'|Tail], A, C, G1, T) :- count(Tail, A, C, G, T), G1 is G + 1.
count(['T'|Tail], A, C, G, T1) :- count(Tail, A, C, G, T), T1 is T + 1.
