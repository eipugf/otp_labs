{application, wifeapp,
	[{description, "wife"},
	 {vsn, "1.0"},
	 {modules, [wife_app, wife_supervisor, wife_observer, wife_server, wife_lib]},
     {registered, [wife_server, wife_supervisor]},
     {applications, [kernel, stdlib]},
     {mod, {wife_app,[]}},
     {start_phases, []}
    ]
 }.