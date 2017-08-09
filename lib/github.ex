defmodule Github do

  alias Github.Repositories

  defdelegate get(username),      to: Repositories

end
