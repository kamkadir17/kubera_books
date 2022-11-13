defmodule Kubera.BNR.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :logo, :string
    field :name, :string
    field :owner_id, :string
    field :slug, :string
    field :unique_hash, :string

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :logo, :unique_hash, :slug, :owner_id])
    |> validate_required([:name, :logo, :unique_hash, :slug, :owner_id])
  end
end
