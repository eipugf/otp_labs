{application, farmerapp,
	[{description, "farmer"},
	 {vsn, "1.0"},
	 {modules, [farmer_app, farmer_supervisor, farmer_observer, farmer_server, farmer_lib]},
     {registered, [farmer_server, farmer_supervisor]},
     {applications, [kernel, stdlib]},
     {mod, {farmer_app,[]}},
     {start_phases, []}
    ]
 }.