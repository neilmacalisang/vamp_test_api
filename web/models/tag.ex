defmodule JsonApi.Tag do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "tags" do

    field :name, :string
    field :identifier, :string
    field :tag_type, :string

    has_many :taggables, JsonApi.Taggable
    has_many :users, through: [:taggables, :user]

    timestamps()
  end

  def changeset(tag, params \\ %{}) do
    tag
    |> cast(params, [:id, :name, :identifier, :tag_type])
    |> validate_required([:id, :name, :identifier, :tag_type])
  end
end
