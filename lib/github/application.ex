defmodule Github.Application do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Github.Repositories, [], function: :start)
    ]

    options = [
      name: Github.Supervisor,
      strategy: :one_for_one
    ]

    Supervisor.start_link(children, options)
  end

end
