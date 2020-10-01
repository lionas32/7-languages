-module(day2).

-export([key_to_value/2]).

-export([calc_total_price/1]).

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
