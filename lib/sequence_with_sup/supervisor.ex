defmodule SequenceWithSup.Supervisor do
  use Supervisor
  def start_link(initial_num) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial_num])
    start_workers(sup, initial_num)
    result
  end
  def start_workers(sup, initial_num) do
    # Start the stash worker
    {:ok, stash} =
      Supervisor.start_child(sup, worker(SequenceWithSup.Stash, [initial_num]))
    # and then the subsupervisor for the actual sequence Server
    Supervisor.start_child(sup, supervisor(SequenceWithSup.SubSupervisor, [stash]))
  end
  def init(_) do
    supervise [], strategy: :one_for_one
  end
end
