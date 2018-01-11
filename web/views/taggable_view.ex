defmodule JsonApi.TaggableView do
  use JsonApi.Web, :view
  use JaSerializer.PhoenixView

  has_one :user,
    serializer: JsonApi.UserView,
    include: true,
    identifiers: :when_included

  has_one :tag,
    serializer: JsonApi.TagView,
    include: true,
    identifiers: :when_included

  def tag(model, conn) do
    case model.tag do
      %Ecto.Association.NotLoaded{} -> %JsonApi.Tag{id: model.tag_id}
      other -> other
    end
  end

  def user(model, conn) do
    case model.tag do
      %Ecto.Association.NotLoaded{} -> %JsonApi.User{id: model.user_id}
      other -> other
    end
  end

end
