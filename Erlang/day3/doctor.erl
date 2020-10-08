% Monitor the translate_service and restart it should it die.
-module(doctor).

-export([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(translator,
                     spawn_link(fun translate_service:loop/0)),
            loop();
        quit -> exit({doctor, die, at, erlang:time()});
        monitor ->
            io:format("Starting monitor for doctor.~n"),
            register(mntr, spawn_link(fun monitor:loop/0));
        {'EXIT', mntr, Reason} ->
            io:format("Monitor ~p with reason ~p.", [mntr, Reason]),
            io:format(" Restarting. ~n"),
            register(mntr, spawn_link(fun monitor:loop/0)),
            loop();
        {'EXIT', From, Reason} ->
            io:format("The shooter ~p died with reason ~p.",
                      [From, Reason]),
            io:format(" Restarting. ~n"),
            self() ! new,
            loop()
    end.
