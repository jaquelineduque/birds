defmodule Birds.Repo do
  use Ecto.Repo,
    otp_app: :birds,
    adapter: Ecto.Adapters.Postgres
end
