%% @author eipugf
%% @doc @todo Add description to start_module.


-module(start_module).

%% ====================================================================
%% API functions
%% ====================================================================
-export([barnapp/0,farmerapp/0,hayfieldapp/0,cowapp/0,wifeapp/0]).



%% ====================================================================
%% Internal functions
%% ====================================================================
barnapp() -> application:start(barnapp).
hayfieldapp() -> application:start(hayfieldapp).
farmerapp() -> application:start(farmerapp),
			   timer:sleep(2000),
			   gen_server:cast({farmer_server,'farmer@127.0.0.1'}, start).

cowapp() -> application:start(cowapp).

wifeapp() -> application:start(wifeapp),
			 timer:sleep(2000),
			 gen_server:cast({wife_server,'wife@127.0.0.1'}, start).
