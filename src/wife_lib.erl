%% @author eipugf
%% @doc @todo Add description to wife_lib.


-module(wife_lib).

%% ====================================================================
%% API functions
%% ====================================================================
-export([do_one_stap/0]).



%% ====================================================================
%% Internal functions
%% ====================================================================

do_one_stap() -> 
	timer:sleep(1500),
	gen_event:notify(wife_observer, send_get_milk),
	procc_result(gen_server:call({cow_server,'cow@127.0.0.1'}, get_milk)),
	gen_server:cast(wife_server, do_work).

procc_result(take_milk) -> gen_event:notify(wife_observer, recieve_take_milk);
procc_result(no_milk) -> gen_event:notify(wife_observer, recieve_no_milk).

