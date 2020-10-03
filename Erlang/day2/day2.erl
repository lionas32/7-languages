-module(day2).

-export([key_to_value/2]).

-export([calc_total_price/1]).

-export([check_tic_tac_toe/1]).

% Consider a list of keyword-value tuples, such as [{erlang, "a functional language"},
% {ruby, "an OO language"}]. Write a function that accepts the list and
% a keyword and returns the associated value for the keyword.
key_to_value(List, Key) ->
    [{_, Value}] = lists:filter(fun ({K, _}) -> Key == K
                                end,
                                List),
    Value.

% Consider a shopping list that looks like [{item quantity price}, ...]. Write a
% list comprehension that builds a list of items of the form [{item total_price},
% ...], where total_price is quantity times price.
calc_total_price(List) ->
    [{Item, Quantity * Price}
     || {Item, Quantity, Price} <- List].

% Write a program that reads a tic-tac-toe board presented as a list or a
% tuple of size nine. Return the winner (x or o) if a winner has been determined, cat if there are no more possible moves, or no_winner if no player
% has won yet.
check_rows([H1, H2, H3, H4, H5, H6, H7, H8, H9],
           Player) ->
    WonRow = fun (X) -> X == Player end,
    lists:all(WonRow, [H1, H4, H7]) or
        lists:all(WonRow, [H2, H5, H8])
        or lists:all(WonRow, [H3, H6, H9]).

check_columns([], _) -> false;
check_columns([H1, H2, H3 | Tail], Player) ->
    WonRow = fun (X) -> X == Player end,
    lists:all(WonRow, [H1, H2, H3]) or
        check_columns(Tail, Player).

check_tic_tac_toe(List) ->
    A = check_columns(List, o) or check_rows(List, o),
    B = check_columns(List, x) or check_rows(List, x),
    C = lists:any(fun (X) -> X == ' ' end, List),
    if A -> o;
       B -> x;
       C -> no_winner;
       true -> cat
    end.
