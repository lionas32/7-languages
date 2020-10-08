% Monitor the translate_service and restart it should it die.
-module(monitor).

-export([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(doc, spawn_link(fun doctor:loop/0)),
            loop();
        {'EXIT', From, Reason} ->
            io:format("The doctor ~p died with reason ~p.",
                      [From, Reason]),
            io:format(" Restarting. ~n"),
            self() ! new,
            loop()
    end.
