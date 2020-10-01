-module(day1).

-export([count_words/1]).

-export([count_to_10/0]).

-export([match_success_fail/1]).

counting_words([_], Num) -> Num + 1;
counting_words([_ | Tail], Num) ->
    counting_words(Tail, Num + 1).

% Write a function that uses recursion to return the number of words in
% a string.
count_words(List) ->
    counting_words(string:lexemes(List, " "), 0).

% Write a function that uses recursion to count to ten.
counting_to_10(10) -> 10;
counting_to_10(Num) -> counting_to_10(Num + 1).

count_to_10() -> counting_to_10(1).

% Write a function that uses matching to selectively print “success” or
% “error: message” given input of the form {error, Message} or success.
match_success_fail({error, Message}) ->
    "error: " ++ Message;
match_success_fail(success) -> "success".
