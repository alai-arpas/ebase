mix deps.get --only prod
MIX_ENV=prod mix compile

# ----------------------------
MIX_ENV=prod mix assets.deploy
# undo -> MIX_ENV=prod mix assets.deploy
mix phx.digest.clean --all

PORT=4005 MIX_ENV=prod mix phx.server
