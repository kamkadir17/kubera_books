defmodule KuberaWeb.PageLive.Index do
  use KuberaWeb, :live_view

  alias Kubera.CMS
  alias Kubera.CMS.Page

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :pages, list_pages())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Editing!!! from Dashboard Page")
    |> assign(:page, CMS.get_page!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Page")
    |> assign(:page, %Page{})
  end

  defp apply_action(socket, :index, _params) do
    socket
     |> assign(:page_title, "Listing all contents of Pages")
    # |> assign(:page, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    page = CMS.get_page!(id)
    {:ok, _} = CMS.delete_page(page)

    {:noreply, assign(socket, :pages, list_pages())}
  end

  defp list_pages do
    CMS.list_pages()
  end
end
