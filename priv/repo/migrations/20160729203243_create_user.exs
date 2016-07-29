defmodule Mula.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :last_name, :string
      add :email, :string
      add :encrypted_password, :string
      add :enable, :boolean, default: false, null: false
      add :company_id, references(:companies, on_delete: :nothing)

      timestamps()
    end
    create index(:users, [:company_id])
    create unique_index(:users, [:email])

  end
end
