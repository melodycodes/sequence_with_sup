{application,sequence_with_sup,
             [{description,"sequence_with_sup"},
              {vsn,"0.0.4"},
              {modules,['Elixir.SequenceWithSup',
                        'Elixir.SequenceWithSup.Server',
                        'Elixir.SequenceWithSup.Server.State',
                        'Elixir.SequenceWithSup.Stash',
                        'Elixir.SequenceWithSup.SubSupervisor',
                        'Elixir.SequenceWithSup.Supervisor']},
              {applications,[kernel,stdlib,elixir,logger]},
              {mod,{'Elixir.SequenceWithSup',[]}},
              {env,[{initial_num,456}]},
              {registered,['Elixir.SequenceWithSup.Server']}]}.