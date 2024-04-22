% Define small squares and their counts
small_square(Count, FinalSSquare) :-
    % Define each small square and its count
    ((SSquare1 = [1, 4, 5, 8], Count1 = 1) ; (SSquare1 = [], Count1 = 0)), 
    ((union(SSquare1, [2, 5, 6, 9], SSquare2), Count2 is Count1 + 1) ; (SSquare2 = SSquare1, Count2 = Count1)), 
    ((union(SSquare2, [3, 6, 7, 10], SSquare3), Count3 is Count2 + 1) ; (SSquare3 = SSquare2, Count3 = Count2)), 
    ((union(SSquare3, [8, 11, 12, 15], SSquare4), Count4 is Count3 + 1) ; (SSquare4 = SSquare3, Count4 = Count3)), 
    ((union(SSquare4, [9, 12, 13, 16], SSquare5), Count5 is Count4 + 1) ; (SSquare5 = SSquare4, Count5 = Count4)), 
    ((union(SSquare5, [10, 13, 14, 17], SSquare6), Count6 is Count5 + 1) ; (SSquare6 = SSquare5, Count6 = Count5)), 
    ((union(SSquare6, [15, 18, 19, 22], SSquare7), Count7 is Count6 + 1) ; (SSquare7 = SSquare6, Count7 = Count6)), 
    ((union(SSquare7, [16, 19, 20, 23], SSquare8), Count8 is Count7 + 1) ; (SSquare8 = SSquare7, Count8 = Count7)), 
    % Define the final small square and its count
    ((union(SSquare8, [17, 20, 21, 24], FinalSSquare), Count is Count8 + 1) ; (FinalSSquare = SSquare8, Count = Count8)).

% Define medium squares and their counts
medium_square(Initial, Count, FinalMSquare) :-
    % Define each medium square
    Square1 = [1, 2, 4, 6, 11, 13, 15, 16], 
    Square2 = [2, 3, 5, 7, 12, 14, 16, 17], 
    Square3 = [8, 9, 11, 13, 18, 20, 22, 23], 
    Square4 = [9, 10, 12, 14, 19, 21, 23, 24], 
    % Combine each square with the initial configuration and update count
    ((union(Initial, Square1, MSquare1), Count1 = 1) ; (MSquare1 = Initial, Count1 = 0)), 
    ((union(MSquare1, Square2, MSquare2), Count2 is Count1 + 1) ; (MSquare2 = MSquare1, Count2 = Count1)), 
    ((union(MSquare2, Square3, MSquare3), Count3 is Count2 + 1) ; (MSquare3 = MSquare2, Count3 = Count2)), 
    % Combine the last square with the initial configuration and update count
    ((union(MSquare3, Square4, FinalMSquare), Count is Count3 + 1) ; (FinalMSquare = MSquare3, Count = Count3)).

% Define large squares and their counts
large_square(Initial, Count, FinalLSquare) :-
    % Define the large square
    Square1 = [1, 2, 3, 4, 7, 11, 14, 18, 21, 22, 23, 24], 
    % Combine the square with the initial configuration and update count
    ((union(Initial, Square1, FinalLSquare), Count = 1) ; (FinalLSquare = Initial, Count = 0)).

% Main predicate to solve the puzzle
zapalki(Total, L, M, S) :-
    % Solve for small squares, then medium, then large
    small_square(S, Match1), 
    medium_square(Match1, M, Match2), 
    large_square(Match2, L, FinalMatch),
    % Calculate the total remaining matches
    length(FinalMatch, Len),
    Total is 24 - Len,
    % Print the solution
    write("Solution:\n"), 
    draw_matches(FinalMatch).

% Draw the matches based on the solution
draw_matches(K) :-
    % Draw each row based on match positions
    (member(1, K) -> write("+---+") ; write("+   +")),
    (member(2, K) -> write("---+") ; write("   +")),
    (member(3, K) -> write("---+\n") ; write("   +\n")),
    (member(4, K) -> write("|   ") ; write("    ")),
    (member(5, K) -> write("|   ") ; write("    ")),
    (member(6, K) -> write("|   ") ; write("    ")),
    (member(7, K) -> write("|\n") ; write(" \n")),
    (member(8, K) -> write("+---+") ; write("+   +")),
    (member(9, K) -> write("---+") ; write("   +")),
    (member(10, K) -> write("---+\n") ; write("   +\n")),
    (member(11, K) -> write("|   ") ; write("    ")),
    (member(12, K) -> write("|   ") ; write("    ")),
    (member(13, K) -> write("|   ") ; write("    ")),
    (member(14, K) -> write("|\n") ; write(" \n")),
    (member(15, K) -> write("+---+") ; write("+   +")),
    (member(16, K) -> write("---+") ; write("   +")),
    (member(17, K) -> write("---+\n") ; write("   +\n")),
    (member(18, K) -> write("|   ") ; write("    ")),
    (member(19, K) -> write("|   ") ; write("    ")),
    (member(20, K) -> write("|   ") ; write("    ")),
    (member(21, K) -> write("|\n") ; write(" \n")),
    (member(22, K) -> write("+---+") ; write("+   +")),
    (member(23, K) -> write("---+") ; write("   +")),
    (member(24, K) -> write("---+\n") ; write("   +\n")).
