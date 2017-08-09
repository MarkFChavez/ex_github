defmodule Github.Application do

  use Application

  def start(_type, _args) do
    # start supervisor here... 
    Github.Repositories.start()
  end

end
