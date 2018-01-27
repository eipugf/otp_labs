%% @author eipugf
%% @doc @todo Add description to farmer_lib.


-module(farmer_lib).

%% ====================================================================
%% API functions
%% ====================================================================
-export([one_life_stap/0]).



%% ====================================================================
%% Internal functions
%% ====================================================================


one_life_stap() -> 
	get_grass(),
	timer:sleep(1500),
	gen_server:cast(farmer_server, do_next_iter).

get_grass() -> 
	gen_event:notify(farmer_observer, send_get_grass),
	process_res(gen_server:call({hayfield_server,'hayfield@127.0.0.1'}, give_grass)).

process_res(take_grass) -> 
	gen_event:notify(farmer_observer, recieve_take_grass),
	gen_server:cast({barn_server,'barn@127.0.0.1'}, {save_grass, 10});

process_res(no_grass) -> gen_event:notify(farmer_observer, recieve_no_grass).

