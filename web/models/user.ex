defmodule Mula.User do
  use Mula.Web, :model

  schema "users" do
    field :name, :string
    field :last_name, :string
    field :email, :string
    field :encrypted_password, :string
    field :enable, :boolean, default: false
    belongs_to :company, Mula.Company

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :last_name, :email, :encrypted_password, :enable])
    |> validate_required([:name, :last_name, :email, :encrypted_password, :enable])
  end
end
