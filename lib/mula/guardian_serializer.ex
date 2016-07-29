defmodule Mula.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Mula.Repo
  alias Mula.Company
  alias Mula.Employee

  def for_token(company = %Company{}), do: { :ok, "Company:#{company.id}" }
  def for_token(employee = %Employee{}), do: { :ok, "Employee:#{employee.id}" }
  def for_token(_), do: { :error, "Unknown resource type" }

  def from_token("Company:" <> id), do: { :ok, Repo.get(Company, id) }
  def from_token("Employee:" <> id), do: { :ok, Repo.get(Employee, id) }
  def from_token(_), do: { :error, "Unknown resource type" }
end
