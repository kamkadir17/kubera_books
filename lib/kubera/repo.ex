defmodule Kubera.Repo do
  use Ecto.Repo,
    otp_app: :kubera,
    adapter: Ecto.Adapters.Postgres
end
