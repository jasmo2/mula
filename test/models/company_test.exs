defmodule Mula.CompanyTest do
  use Mula.ModelCase

  alias Mula.Company

  @valid_attrs %{
    description: "some content",
    email: "some content",
    enabled: true,
    name: "some content",
    slug: "some content"
  }

  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Company.changeset(%Company{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Company.changeset(%Company{}, @invalid_attrs)
    refute changeset.valid?
  end
end
