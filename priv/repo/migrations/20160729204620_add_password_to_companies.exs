defmodule Mula.Repo.Migrations.AddPasswordToCompanies do
  use Ecto.Migration

  def change do
    alter table(:companies) do
      add :encrypted_password, :string
    end
  end
end
