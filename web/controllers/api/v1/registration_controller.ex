defmodule Mula.RegistrationController  do
  use Mula.Web, :controller

  alias Mula.{Repo, Employee}

  plug :scrub_params, "employees" when action in [:create]

  def create(conn, %{"employees" => employee_params}) do
    changeset = Employee.changeset(%Employee{}, employee_params)

    case Repo.insert(changeset) do
      {:ok, employee} ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(employee, :token)

        conn
        |> put_status(:created)
        |> render(Mula.SessionView, "show.json", jwt: jwt, employee: employee)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Mula.RegistrationView, "error.json", changeset: changeset)
    end
  end
end
