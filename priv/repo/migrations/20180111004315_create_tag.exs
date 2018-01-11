defmodule JsonApi.Repo.Migrations.CreateTag do
  use Ecto.Migration

  def change do
    create table(:tags, primary_key: false) do
    	add :id, :uuid, primary_key: true
    	add :name, :string
    	add :identifier, :string
    	add :tag_type, :string
      timestamps()
    end
  end
end
