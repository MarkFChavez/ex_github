defmodule Github.Repositories do

  @base_uri "https://api.github.com"

  def get(username) do
    HTTPoison.start()
    HTTPoison.get!("#{@base_uri}/users/#{username}/repos")
    |> parse_response
  end

  defp parse_response(%HTTPoison.Response{status_code: 200, body: body}) do
    body
    |> JSON.decode
    |> get_result
  end

  defp parse_response(%HTTPoison.Error{reason: reason}) do
    reason
  end

  defp get_result({:ok, result}), do: result

end
