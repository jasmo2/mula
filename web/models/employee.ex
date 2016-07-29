defmodule Mula.Employee do
  use Mula.Web, :model

  schema "employees" do
    field :name, :string
    field :last_name, :string
    field :email, :string
    field :encrypted_password, :string
    field :enable, :boolean, default: false
    belongs_to :company, Mula.Company

    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  # @required_fields ~w(name last_name email enabled password)
  # @optional_fields ~w(encrypted_password)

  def changeset(employee, params \\ %{}) do
    employee
    |> cast(params, [:name, :last_name, :email, :encrypted_password, :enable])
    |> validate_required([:name, :last_name, :email, :password, :enable])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
    |> validate_confirmation(:password, message: "Password does not match")
    |> unique_constraint(:email, message: "Email already taken")
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
