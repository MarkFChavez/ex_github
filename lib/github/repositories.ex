defmodule Github.Repositories do

  @me __MODULE__
  @base_uri "https://api.github.com"

  def start() do
    Agent.start_link(fn -> %{} end, name: @me)
  end

  def get(username) do
    Agent.get(@me, fn state -> state[username] end)
    |> really_get(username)
  end

  defp really_get(_username_not_found = nil, username) do
    HTTPoison.start()
    HTTPoison.get!("#{@base_uri}/users/#{username}/repos")
    |> parse_response(username)
  end

  defp really_get(repos, _username), do: repos

  defp parse_response(%HTTPoison.Response{status_code: 200, body: body}, username) do
    body
    |> JSON.decode
    |> get_result
    |> format_result
    |> update_state(username)
  end

  defp parse_response(_not_found_error = %HTTPoison.Response{status_code: 404, body: _body}, username) do
    IO.puts("#{username} not found")
  end

  defp parse_response(%HTTPoison.Error{reason: reason}, _username) do
    IO.puts("#{reason}")
  end

  defp get_result({:ok, result}), do: result

  defp format_result(result) do
    Enum.map(result, fn(repo) -> Map.get(repo, "name") end)
  end

  defp update_state(results, username) do
    Agent.get_and_update(@me, fn state ->
      {results, Map.put(state, username, results)}
    end)
  end

end
