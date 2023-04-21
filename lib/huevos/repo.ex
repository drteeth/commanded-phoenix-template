defmodule Huevos.Repo do
  use Ecto.Repo,
    otp_app: :huevos,
    adapter: Ecto.Adapters.Postgres
end
