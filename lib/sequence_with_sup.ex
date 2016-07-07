defmodule SequenceWithSup do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(SequenceWithSup.Server, [123]),
      worker(SequenceWithSup.Stack, [[5, "cat", 9]])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SequenceWithSup.Supervisor]
    {:ok, _pid} = Supervisor.start_link(children, opts)
  end
end
