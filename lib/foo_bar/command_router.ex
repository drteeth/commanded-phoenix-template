defmodule FooBar.CommandRouter do
  use Commanded.Commands.Router

  # alias FooBar.Commands

  middleware(Commanded.Middleware.Telemetry)

  # dispatch(Commands.Foo, to: FooBar.Bar, identity: :foo_id)
end
