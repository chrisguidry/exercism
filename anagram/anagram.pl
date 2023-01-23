letters(Word, Letters) :-
    string_chars(Word, Chars),
    msort(Chars, Letters).

anagram(Word, Option) :-
    % anagrams are case insensitive
    string_lower(Word, LowerWord),
    string_lower(Option, LowerOption),
    % A word is not its own anagram
    LowerWord \= LowerOption,
    % Compare the set of letters together
    letters(LowerWord, Letters),
    letters(LowerOption, Letters).

anagram(Word, Options, Matching) :-
    include(anagram(Word), Options, Matching).
