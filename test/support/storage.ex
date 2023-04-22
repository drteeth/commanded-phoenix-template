defmodule FooBar.Storage do
  @readstore_tables ~w(
  )

  @doc """
  Reset the event store and read store databases.
  """
  def reset! do
    Application.stop(:foo_bar)

    reset_eventstore!()
    reset_readstore!()

    Application.ensure_all_started(:foo_bar)
  end

  defp reset_eventstore! do
    config = FooBar.EventStore.config()
    {:ok, conn} = Postgrex.start_link(config)

    EventStore.Storage.Initializer.reset!(conn, config)
  end

  defp reset_readstore! do
    {:ok, conn} = Postgrex.start_link(FooBar.Repo.config())

    if Enum.any?(@readstore_tables) do
      Postgrex.query!(conn, truncate_readstore_tables(), [])
    end
  end

  defp truncate_readstore_tables do
    table_names = Enum.join(@readstore_tables, ",\n")

    """
    TRUNCATE TABLE #{table_names} RESTART IDENTITY;
    """
  end
end
