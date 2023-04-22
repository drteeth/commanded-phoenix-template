defmodule Huevos.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HuevosWeb.Telemetry,
      # Start the Ecto repository
      Huevos.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Huevos.PubSub},
      # Start Finch
      {Finch, name: Huevos.Finch},
      # Start the Endpoint (http/https)
      HuevosWeb.Endpoint,
      Huevos.CommandDispatcher,
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Huevos.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HuevosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
