% Solve the Eight Queens problem by taking a list of queens. Rather than
% a tuple, represent each queen with an integer, from 1–8. Get the row of
% a queen by its position in the list and the column by the value in the
% list.

valid_queen(Queen) :-
    member(Queen, [1,2,3,4,5,6,7,8]).

valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).

diags1([], 9,[]).
diags1([Col|QueensTail], Sum, [Diagonal|DiagonalsTail]) :-
    Diagonal is Col - Sum,
    N is Sum + 1,
    diags1(QueensTail, N, DiagonalsTail).

diags2([], 9, []).
diags2([Col|QueensTail], Sum,[Diagonal|DiagonalsTail]) :-
    Diagonal is Col + Sum,
    N is Sum + 1,
    diags2(QueensTail, N, DiagonalsTail).

eight_queens(Board) :- 
    Board = [_,_,_,_,_,_,_,_],
    valid_board(Board),

    diags1(Board, 1, Diags1),
    diags2(Board, 1, Diags2),

    fd_all_different(Board),
    fd_all_different(Diags1),
    fd_all_different(Diags2).