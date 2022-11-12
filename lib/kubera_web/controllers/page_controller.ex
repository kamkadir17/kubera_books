defmodule KuberaWeb.PageController do
  use KuberaWeb, :controller

  def index(conn, _params) do
    render(conn, "index1.html")
  end
end
