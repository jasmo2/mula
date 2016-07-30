  defmodule Mula.Company do
  use Mula.Web, :model
  
  schema "companies" do
    field :name, :string
    field :slug, :string
    field :email, :string
    field :encrypted_password, :string
    field :description, :string
    field :enabled, :boolean, default: true

    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  # @required_fields ~w(name enabled email password)
  # @optional_fields ~w(slug description encrypted_password)

  def changeset(company, params \\ %{}) do
    company
    |> cast(params, [:name, :slug, :email,:password, :description, :enabled])
    |> validate_required([:name, :email, :enabled, :password])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
    |> validate_confirmation(:password, message: "Las contraseñas no coinciden")
    |> unique_constraint(:email, message: "El correo electronico ya está en uso")
    |> generate_encrypted_password
  end

  defp generate_encrypted_password(current_changeset) do
    case current_changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(current_changeset, :encrypted_password, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        current_changeset
    end
  end
end
