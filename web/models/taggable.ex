defmodule JsonApi.Taggable do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "taggables" do

    belongs_to :user, JsonApi.User, foreign_key: :user_id, type: :binary_id
    belongs_to :tag, JsonApi.Tag, foreign_key: :tag_id, type: :binary_id

    timestamps()
  end

  def changeset(taggable, params \\ %{}) do
    taggable
    |> cast(params, [:id, :user_id, :tag_id])
    |> validate_required([:id, :user_id, :tag_id])
  end
end
