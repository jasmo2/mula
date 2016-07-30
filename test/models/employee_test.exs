defmodule Mula.EmployeeTest do
  use Mula.ModelCase

  alias Mula.Employee

  @valid_attrs %{
    email: "employee@employee.employee",
    enable: true,
    password: "12345678",
    last_name: "some content",
    name: "some content"
  }
  @invalid_attrs %{
    email: "",
    password: "",
    name: ""
  }

  test "changeset with valid attributes" do
    changeset = Employee.changeset(%Employee{}, @valid_attrs)
    IO.inspect changeset
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Employee.changeset(%Employee{}, @invalid_attrs)
    refute changeset.valid?
  end
end
