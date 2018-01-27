{application, barnapp,
	[{description, "barn"},
	 {vsn, "1.0"},
	 {modules, [barn_app, barn_supervisor, barn_observer, barn_server, barn_lib]},
     {registered, [barn_server, barn_supervisor]},
     {applications, [kernel, stdlib]},
     {mod, {barn_app,[]}},
     {start_phases, []}
    ]
 }.