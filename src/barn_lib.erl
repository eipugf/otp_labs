%% @author eipugf
%% @doc @todo Add description to barn_lib.


-module(barn_lib).

%% ====================================================================
%% API functions
%% ====================================================================
-export([get_grass/1,save_grass/2]).



%% ====================================================================
%% Internal functions
%% ====================================================================
get_grass(GrassCount) when GrassCount < 20 ->
	gen_event:notify(barn_observer, get_grass),
	gen_event:notify(barn_observer, no_grass),
	{no_grass, 0};

get_grass(_) ->
	gen_event:notify(barn_observer, get_grass),
	gen_event:notify(barn_observer, take_grass),
	{take_grass, 20}.

save_grass(GrassCount, NewGrass) ->
	gen_event:notify(barn_observer, save_grass),
	GrassCount+NewGrass.
