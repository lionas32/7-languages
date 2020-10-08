% Monitor the translate_service and restart it should it die.
-module(translate_service).

-export([loop/0, translate/2]).

loop() ->
    receive
        {From, "casa"} ->
            From ! "house",
            loop();
        {From, "blanca"} ->
            From ! "white",
            loop();
        {From, _} ->
            From ! "I don't understand.",
            exit({translate_service, die, at, erlang:time()})
    end.

translate(To, Word) ->
    To ! {self(), Word},
    receive Translation -> Translation end.
