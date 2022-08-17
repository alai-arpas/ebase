defmodule EbaseWeb.PageController do
  use EbaseWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
