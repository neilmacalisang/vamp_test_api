defmodule JsonApi.UserController do
  use JsonApi.Web, :controller

  alias JsonApi.User

  def index(conn, _params) do
    users = Repo.all(User) |> Repo.preload(taggables: :tag)
    render(conn, "index.json-api", data: users)
  end

end
