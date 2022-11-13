defmodule KuberaWeb.UserLive.Index do
  use KuberaWeb, :live_view

  alias Kubera.PROFILES
  alias Kubera.PROFILES.User

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :users, list_users())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit User")
    |> assign(:user, PROFILES.get_user!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New User")
    |> assign(:user, %User{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing User")
    |> assign(:user, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    user = PROFILES.get_user!(id)
    {:ok, _} = PROFILES.delete_user(user)

    {:noreply, assign(socket, :users, list_users())}
  end

  defp list_users do
    PROFILES.list_users()
  end
end
