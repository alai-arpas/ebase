import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ebase, EbaseWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Dq+rmNiGcah3Xrg4Z0KEJqk+fkpVL/d6Zps2JO37xU3znQfagmCQP5syH2jw0n3w",
  server: false

# In test we don't send emails.
config :ebase, Ebase.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
