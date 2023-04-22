defmodule Huevos.CommandRouter do
  use Commanded.Commands.Router

  # alias Huevos.Commands

  middleware(Commanded.Middleware.Telemetry)

  # dispatch(Commands.Foo, to: Huevos.Bar, identity: :foo_id)
end
