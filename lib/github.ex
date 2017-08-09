defmodule Github do

  alias Github.Repositories

  defdelegate start(), to: Repositories
  defdelegate get(username), to: Repositories

end
