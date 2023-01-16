letter(Character) :- char_type(Character, alpha).

isogram(String) :-
    string_lower(String, Lower),
    string_chars(Lower, Characters),
    include(letter, Characters, OnlyLetters),
    is_set(OnlyLetters).
