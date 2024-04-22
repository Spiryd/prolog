% Define the list of keywords
keywords(['read', 'write', 'if', 'then', 'else', 'fi', 'while', 'do', 'od', 'and', 'or', 'mod']).

% Define the list of separators
separators([';', '+', '-', '*', '/', '(', ')', '<', '>', '=<', '>=', ':=', '=', '/=']).

% Main predicate
scanner(Stream, Tokens) :-
    get_char(Stream, Char),
    scanner(Char, Stream, Tokens).

% Base case: end of stream
scanner(end_of_file, _, []) :- !.

% Case: whitespace
scanner(Char, Stream, [Token|Tokens]) :-
    char_type(Char, space), !,
    get_char(Stream, NextChar),
    scanner(NextChar, Stream, [Token|Tokens]).

% Case: letter
scanner(Char, Stream, [Token|Tokens]) :-
    char_type(Char, alpha), !,
    read_word(Stream, Char, Word),
    (   keywords(Keywords), member(Word, Keywords)
    ->  Token = key(Word)
    ;   Token = id(Word)
    ),
    get_char(Stream, NextChar),
    scanner(NextChar, Stream, Tokens).

% Case: digit
scanner(Char, Stream, [Token|Tokens]) :-
    char_type(Char, digit), !,
    read_number(Stream, Char, Number),
    Token = int(Number),
    get_char(Stream, NextChar),
    scanner(NextChar, Stream, Tokens).

% Case: special character
scanner(Char, Stream, [Token|Tokens]) :-
    read_separator(Stream, Char, Separator),
    Token = sep(Separator),
    get_char(Stream, NextChar),
    scanner(NextChar, Stream, Tokens).

% Helper predicate to read a word
read_word(Stream, Char, Word) :-
    get_char(Stream, NextChar),
    (   char_type(NextChar, alpha)
    ->  read_word(Stream, NextChar, RestWord),
        atom_concat(Char, RestWord, Word)
    ;   put_char(NextChar),
        Word = Char
    ).

% Helper predicate to read a number
read_number(Stream, Char, Number) :-
    get_char(Stream, NextChar),
    (   char_type(NextChar, digit)
    ->  read_number(Stream, NextChar, RestNumber),
        atom_concat(Char, RestNumber, Number)
    ;   put_char(NextChar),
        Number = Char
    ).

% Helper predicate to read a separator
read_separator(Stream, Char, Separator) :-
    get_char(Stream, NextChar),
    (   separators(Separators), atom_concat(Char, NextChar, PossibleSeparator), member(PossibleSeparator, Separators)
    ->  Separator = PossibleSeparator
    ;   put_char(NextChar),
        Separator = Char
    ).