defmodule JsonApi.UserView do
  use JsonApi.Web, :view
  use JaSerializer.PhoenixView

  attributes [:full_name, :country]

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
