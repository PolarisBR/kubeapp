defmodule KubeAppWeb.PageController do
  use KubeAppWeb, :controller

  def index(conn, _params) do
    json(conn, %{branch: "branch name"})
  end
end
