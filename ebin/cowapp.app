{application, cowapp,
	[{description, "cow"},
	 {vsn, "1.0"},
	 {modules, [cow_app, cow_supervisor, cow_observer, cow_server, cow_lib]},
     {registered, [cow_server, cow_supervisor]},
     {applications, [kernel, stdlib]},
     {mod, {cow_app,[]}},
     {start_phases, []}
    ]
 }.