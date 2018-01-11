# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     JsonApi.Repo.insert!(%JsonApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

alias JsonApi.Repo
alias JsonApi.User
alias JsonApi.Tag
alias JsonApi.Taggable

defmodule JsonApi.Seeds do

	def seed_user(row) do
		changeset = User.changeset(%User{},row)
		Repo.insert!(changeset)
	end

	def seed_tag(row) do
		changeset = Tag.changeset(%Tag{},row)
		Repo.insert!(changeset)
	end

	def seed_taggable(row) do
		changeset = Taggable.changeset(%Taggable{},row)
		Repo.insert!(changeset)
	end
end

Repo.delete_all(User)
File.stream!(Path.expand("priv/seed_data/users.csv"))
  |> CSV.decode(headers: [:id, :full_name, :country, :inserted_at, :updated_at])
  |> Enum.each(&JsonApi.Seeds.seed_user/1)

Repo.delete_all(Tag)
File.stream!(Path.expand("priv/seed_data/tags.csv"))
  |> CSV.decode(headers: [:id, :name, :identifier, :tag_type, :inserted_at, :updated_at])
  |> Enum.each(&JsonApi.Seeds.seed_tag/1)

Repo.delete_all(Taggable)
File.stream!(Path.expand("priv/seed_data/taggables.csv"))
  |> CSV.decode(headers: [:id, :user_id, :tag_id, :inserted_at, :updated_at])
  |> Enum.each(&JsonApi.Seeds.seed_taggable/1)