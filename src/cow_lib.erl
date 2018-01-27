%% @author eipugf
%% @doc @todo Add description to cow_lib.


-module(cow_lib).

%% ====================================================================
%% API functions
%% ====================================================================
-export([get_milk/1,process_resget/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

get_milk(CountMilk) when CountMilk >= 30 -> 
	gen_event:notify(cow_observer, recieve_get_milk),
	gen_event:notify(cow_observer, send_take_milk),
	{take_milk, 30};

get_milk(CountMilk) -> 
	gen_event:notify(cow_observer, recieve_get_milk),
	gen_event:notify(cow_observer, send_no_milk),
	process_resget(gen_server:call({barn_server,'barn@127.0.0.1'}, get_grass)),
	{no_milk, 0}.

process_resget(take_grass) ->
	gen_event:notify(cow_observer, receive_take_grass),
	gen_server:cast(cow_server, {add_milk, 1});

process_resget(no_grass) ->
	gen_event:notify(cow_observer, receive_no_grass),
	gen_server:cast(cow_server, {add_milk, 0}).





