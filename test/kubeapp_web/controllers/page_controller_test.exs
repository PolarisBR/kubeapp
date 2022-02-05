defmodule KubeAppWeb.PageControllerTest do
  use KubeAppWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert %{"branch" => _} = json_response(conn, 200)
  end
end
