defmodule Kubera.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :password, :string
      add :role, :string
      add :remember_token, :string
      add :facebook_id, :string
      add :google_id, :string
      add :github_id, :string
      add :contact_name, :string
      add :company_name, :string
      add :website, :string
      add :enable_portal, :string
      add :currency_id, :string
      timestamps()
    end
  end
end
