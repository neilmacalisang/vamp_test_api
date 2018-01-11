defmodule JsonApi.User do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "users" do

    field :country, :string
    field :full_name, :string

    has_many :taggables, JsonApi.Taggable, on_delete: :delete_all, on_replace: :delete
    has_many :tags, through: [:taggables, :tag]
    
    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:id, :full_name, :country])
    |> validate_required([:id, :full_name, :country])
  end
end
