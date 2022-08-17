defmodule Ebase.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      EbaseWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ebase.PubSub},
      # Start the Endpoint (http/https)
      EbaseWeb.Endpoint
      # Start a worker by calling: Ebase.Worker.start_link(arg)
      # {Ebase.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ebase.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EbaseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
