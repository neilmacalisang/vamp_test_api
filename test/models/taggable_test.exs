defmodule JsonApi.TaggableTest do
  use JsonApi.ModelCase

  alias JsonApi.Taggable

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Taggable.changeset(%Taggable{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Taggable.changeset(%Taggable{}, @invalid_attrs)
    refute changeset.valid?
  end
end
