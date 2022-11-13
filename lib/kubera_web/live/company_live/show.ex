defmodule KuberaWeb.CompanyLive.Show do
  use KuberaWeb, :live_view

  alias Kubera.BNR

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:company, BNR.get_company!(id))}
  end

  defp page_title(:show), do: "Show Company"
  defp page_title(:edit), do: "Edit Company"
end
