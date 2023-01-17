is_anagram(Word, Option) :-
    % anagrams are case insensitive
    string_lower(Word, LowerWord),
    string_lower(Option, LowerOption),
    % A word is not its own anagram
    LowerWord \= LowerOption,
    % Compare the set of letters together
    string_chars(LowerWord, WordChars),
    msort(WordChars, SortedWordChars),
    string_chars(LowerOption, OptionChars),
    msort(OptionChars, SortedOptionChars),
    SortedWordChars == SortedOptionChars.


anagram(Word, Options, Matching) :-
    include([Option] >> (is_anagram(Word, Option)), Options, Matching).
