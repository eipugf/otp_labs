{application, hayfieldapp,
	[{description, "Factorial calculator"},
	 {vsn, "1.0"},
	 {modules, [hayfield_app, hayfield_supervisor, hayfiled_observer, hayfield_server, hayfield_lib]},
     {registered, [ hayfield_server, hayfield_supervisor]},
     {applications, [kernel, stdlib]},
     {mod, {hayfield_app,[]}},
     {start_phases, []}
    ]
 }.