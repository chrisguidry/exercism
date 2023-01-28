wordy(Question, Answer) :-
    string_concat(NoQuestion, "?", Question),
    split_string(NoQuestion, " ", " ", Words),
    answer(Words, Answer).

answer(["What", "is", Number|Rest], Answer) :-
    (number_string(N, Number) -> true; throw(error(syntax_error, "nope"))),
    evaluate(N, Rest, Answer), !.

answer(["What", "is"|[]], _) :-
    throw(error(syntax_error, "what is what, homie?")).

answer([AnythingElse|_], _) :-
    throw(error(unknown_operation_error, AnythingElse)).

evaluate(L, ["plus", Right|Rest], Answer) :-
    number_string(R, Right),
    This is L + R,
    evaluate(This, Rest, Answer), !.

evaluate(L, ["minus", Right|Rest], Answer) :-
    number_string(R, Right),
    This is L - R,
    evaluate(This, Rest, Answer), !.

evaluate(L, ["multiplied", "by", Right|Rest], Answer) :-
    number_string(R, Right),
    This is L * R,
    evaluate(This, Rest, Answer), !.

evaluate(L, ["divided", "by", Right|Rest], Answer) :-
    number_string(R, Right),
    This is L / R,
    evaluate(This, Rest, Answer), !.

% sigh this is cheeseball but I can't figure out how to produce the right combination
% of errors
evaluate(_, ["cubed"|[]], _) :-
    throw(error(unknown_operation_error, AnythingElse)).

evaluate(_, [AnythingElse|[]], _) :-
    throw(error(syntax_error, AnythingElse)).

evaluate(_, [UnknownBinaryOperator, _|_], _) :-
    throw(error(syntax_error, UnknownBinaryOperator)).

evaluate(L, [], L).
