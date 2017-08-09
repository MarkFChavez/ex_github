defmodule Github do

  alias Github.Repositories

  defdelegate get(username),      to: Repositories
  defdelegate intentionally_fail, to: Repositories

end
