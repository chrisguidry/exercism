binary(String, Decimal) :-
    % Convert the string into individual characters, reversed to LittleEndian
    string_chars(String, BigEndian),
    reverse(BigEndian, LittleEndian),
    % Convert the characters to integers, ensuring they are either 0 or 1
    maplist(atom_number, LittleEndian, Digits),
    forall(member(D, Digits), between(0, 1, D)),
    % Produce the places for each slot in the list (this is like Python's enumerate)
    length(Digits, Length),
    EndIndex is Length - 1,
    numlist(0, EndIndex, Places),
    % Do the multiplication of each place, then sum it to get the final answer
    maplist([Place, Digit, Y] >> (Y is Digit * 2 ** Place), Places, Digits, Computed),
    sum_list(Computed, Decimal).
