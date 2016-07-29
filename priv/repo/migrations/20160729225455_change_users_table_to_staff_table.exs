defmodule Mula.Repo.Migrations.ChangeUsersTableToStaffTable do
  use Ecto.Migration

  def change do
    rename table(:users), to: table(:employees)
  end
end
