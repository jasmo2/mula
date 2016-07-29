defmodule Mula.Company do
  use Mula.Web, :model

  schema "companies" do
    field :name, :string
    field :slug, :string
    field :email, :string
    field :encrypted_password, :string
    field :description, :string
    field :enabled, :boolean, default: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :url, :email, :description, :enabled])
    |> validate_required([:name, :url, :email, :description, :enabled])
  end
end
