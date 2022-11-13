defmodule Kubera.PROFILES.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :phone, :string
    field :password, :string
    field :role, :string
    field :remember_token, :string
    field :facebook_id, :string
    field :google_id, :string
    field :github_id, :string
    field :contact_name, :string
    field :company_name, :string
    field :website, :string
    field :enable_portal, :string
    field :currency_id, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :phone, :password, :role, :remember_token, :facebook_id, :google_id, :github_id, :contact_name, :company_name, :website, :enable_portal, :currency_id])
    |> validate_required([:name, :email, :phone, :password, :role, :remember_token, :facebook_id, :google_id, :github_id, :contact_name, :company_name, :website, :enable_portal, :currency_id])

  end
end
