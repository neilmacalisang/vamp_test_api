defmodule JsonApi.TagView do
  use JsonApi.Web, :view
  use JaSerializer.PhoenixView

  attributes [:name, :identifier, :tag_type]

  has_many :taggables,
    serializer: JsonApi.TaggableView,
    include: true,
    identifiers: :when_included

  def taggables(model, conn) do
    case model.taggables do
      %Ecto.Association.NotLoaded{} -> 
      model
        |> Ecto.assoc(:taggables)
        |> JsonApi.Repo.all
      other -> other
    end
  end

end
