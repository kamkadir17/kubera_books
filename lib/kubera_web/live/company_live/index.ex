defmodule KuberaWeb.CompanyLive.Index do
  use KuberaWeb, :live_view

  alias Kubera.BNR
  alias Kubera.BNR.Company

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :companies, list_companies())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Company")
    |> assign(:company, BNR.get_company!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Company")
    |> assign(:company, %Company{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Companies")
    |> assign(:company, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    company = BNR.get_company!(id)
    {:ok, _} = BNR.delete_company(company)

    {:noreply, assign(socket, :companies, list_companies())}
  end

  defp list_companies do
    BNR.list_companies()
  end
end
