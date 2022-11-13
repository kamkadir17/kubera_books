defmodule Kubera.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :logo, :string
      add :unique_hash, :string
      add :slug, :string
      add :owner_id, :string

      timestamps()
    end
  end
end
