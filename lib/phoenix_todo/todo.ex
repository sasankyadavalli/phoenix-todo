defmodule PhoenixTodo.Todo do
	@moduledoc false

	import Ecto.Query
	alias PhoenixTodo.Repo
	alias PhoenixTodo.Todo.TodoSchema

	def create_todo(params) do
		changeset = TodoSchema.changeset(%TodoSchema{}, params)
		Repo.insert(changeset)
	end

	def get_todo(id) when is_binary(id) do
		case Repo.get(TodoSchema, id) do
			nil ->
				nil
			todo ->
				{:ok, todo}
		end
	end

	def list_todos() do
		Repo.all(TodoSchema)
	end

	def update_todo(id, params) when is_binary(id) do
		todo = Repo.get(TodoSchema, id)
		update_todo(todo, params)
	end

	def update_todo(%TodoSchema{} = todo, params) do
		changeset = TodoSchema.changeset(todo, params)
		Repo.update(changeset)
	end

	def delete_todo(id) when is_binary(id) do
		todo = Repo.get(TodoSchema, id)
		Repo.delete(todo)
	end
end