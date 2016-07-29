defmodule Mula.Repo.Migrations.CreateCompany do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :slug, :string
      add :email, :string
      add :description, :text
      add :enabled, :boolean, default: false, null: false

      timestamps()
    end
    create unique_index(:companies, [:email])
  end
end
