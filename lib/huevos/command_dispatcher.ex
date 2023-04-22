defmodule Huevos.CommandDispatcher do
  use Commanded.Application,
    otp_app: :huevos,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: Huevos.EventStore
    ]

  router(Huevos.CommandRouter)
end
