defmodule SequenceWithSup.Stash do
  use GenServer

  #####
  # External API
  def start_link(current_number) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, current_number)
  end
  def save_value(pid, values) do
    GenServer.cast pid, {:save_value, values}
  end
  def get_value(pid) do
    GenServer.call pid, :get_value
  end

  #####
  # GenServer implementation
  def handle_call(:get_value, _from, current_value) do
    {:reply, current_value, current_value}
  end
  def handle_cast({:save_value, values}, _current_value) do
    {:noreply, values}
  end
end
