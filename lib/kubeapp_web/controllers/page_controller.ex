defmodule KubeAppWeb.PageController do
  use KubeAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
