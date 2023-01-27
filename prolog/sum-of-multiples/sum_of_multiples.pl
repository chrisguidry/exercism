multiple_of([Factor|Factors], N) :-
    0 =:= N mod Factor, !; multiple_of(Factors, N).

sum_of_multiples(_, 1, 0) :- !.
sum_of_multiples(Factors, Limit, Sum) :-
    Max is Limit - 1,
    numlist(1, Max, NaturalNumbers),
    include(multiple_of(Factors), NaturalNumbers, Multiples),
    sumlist(Multiples, Sum).
