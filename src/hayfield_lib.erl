%% @author eipugf
%% @doc @todo Add description to hayfield_lib.


-module(hayfield_lib).

%% ====================================================================
%% API functions
%% ====================================================================
-export([give_grass/1]).



%% ====================================================================
%% Internal functions
%% ====================================================================

give_grass(GrassCount) when GrassCount >= 10 ->
	gen_event:notify(hayfield_observer, give_grass),
	gen_event:notify(hayfield_observer, take_grass),
	{take_grass, 10};

give_grass(GrassCount) ->
	gen_event:notify(hayfield_observer, give_grass),
	gen_event:notify(hayfield_observer, no_grass),
	{no_grass, -1}.