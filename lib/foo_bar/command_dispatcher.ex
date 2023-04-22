defmodule FooBar.CommandDispatcher do
  use Commanded.Application,
    otp_app: :foo_bar,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: FooBar.EventStore
    ]

  router(FooBar.CommandRouter)
end
