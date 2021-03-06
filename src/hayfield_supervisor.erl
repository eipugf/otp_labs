%% @author eipugf
%% @doc @todo Add description to hayfield_supervisor.


-module(hayfield_supervisor).
-behaviour(supervisor).
-export([init/1,start_link/1]).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).



%% ====================================================================
%% Behavioural functions
%% ====================================================================

%% init/1
%% ====================================================================
%% @doc <a href="http://www.erlang.org/doc/man/supervisor.html#Module:init-1">supervisor:init/1</a>
-spec init(Args :: term()) -> Result when
	Result :: {ok, {SupervisionPolicy, [ChildSpec]}} | ignore,
	SupervisionPolicy :: {RestartStrategy, MaxR :: non_neg_integer(), MaxT :: pos_integer()},
	RestartStrategy :: one_for_all
					 | one_for_one
					 | rest_for_one
					 | simple_one_for_one,
	ChildSpec :: {Id :: term(), StartFunc, RestartPolicy, Type :: worker | supervisor, Modules},
	StartFunc :: {M :: module(), F :: atom(), A :: [term()] | undefined},
	RestartPolicy :: permanent
				   | transient
				   | temporary,
	Modules :: [module()] | dynamic.
%% ====================================================================
init([]) ->
	io:write("supervisor starting"),
 	AChild = {factorserver,{hayfield_server,start_link,[]},
 		permanent,2000,worker,[hayfield_server]},
	BChild = {eventlogger,{hayfield_observer,start_link,[]},
 		permanent,2000,worker,[hayfield_observer]},
 	{ok,{{one_for_one,10,1}, [AChild, BChild]}}.

%% ====================================================================
%% Internal functions
%% ====================================================================
start_link(Args) -> supervisor:start_link({local,?MODULE}, ?MODULE, Args).

