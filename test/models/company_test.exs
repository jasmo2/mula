defmodule Mula.CompanyTest do
  use Mula.ModelCase
  alias Mula.Company

  @valid_attrs %{
    description: "a big description on my testing company",
    email: "company@company.company",
    password: "12345678",
    enabled: true,
    name: "some content",
    slug: "some content"
  }

  @invalid_attrs %{
    password: "",
    email: "",
    name: ""
  }

  test "changeset with valid attributes" do
    v_attrs = @valid_attrs
    changeset = Company.changeset(%Company{}, v_attrs)
    # IO.inspect "/n #{changeset}"
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Company.changeset(%Company{}, @invalid_attrs)
    refute changeset.valid?
  end
end
