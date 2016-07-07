defmodule SequenceWithSup.Stack do
  use GenServer

  ####
  # External API
  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def push(new_val) do
    GenServer.cast(__MODULE__, {:push, new_val})
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  ####
  # GenServer implementation
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail }
  end

  def handle_cast({:push, new_val}, list) do
    {:noreply, [new_val | list]}
  end

  def terminate(reason, state) do
    IO.puts "TERMINATED with reason '#{reason}' and state #{inspect state}"
  end
end
