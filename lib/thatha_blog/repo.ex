defmodule ThathaBlog.Repo do
  use Ecto.Repo,
    otp_app: :thatha_blog,
    adapter: Ecto.Adapters.Postgres
end
