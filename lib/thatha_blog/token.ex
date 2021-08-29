defmodule ThathaBlog.Token do
  use Joken.Config

  def token_config do
    default_claims()
    |> add_claim("sub", nil, &is_valid_uuid/1)
  end

  # def create_token(id) do
  #   Joken.Signer.create(id, )
  # end

  defp is_valid_uuid(sub) when is_binary(sub) do
    IO.inspect(sub)
  end
end
