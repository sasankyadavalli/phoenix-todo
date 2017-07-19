defmodule PhoenixTodo.Web.TodoController do
	@moduledoc false

	use PhoenixTodo.Web, :controller
	
	alias PhoenixTodo.Todo
	alias PhoenixTodo.Web.TodoView

	action_fallback PhoenixTodo.Web.FallbackController 

	def create(conn, params) do
		with {:ok, todo} <- Todo.create_todo(params) do
			conn
			|> put_status(:created)
			|> render(TodoView, "show.json", todo: todo)
		end
	end

	def show(conn, params) do
		with {:ok, todo} <- Todo.get_todo(Map.get(params, "id")),
		do: render(conn, TodoView, "show.json", todo: todo)
	end

	def index(conn, _params) do
		render(conn, TodoView, "index.json", todos: Todo.list_todos())
	end

	def delete(conn, params) do
		with {:ok, todo} <- Todo.delete_todo(Map.get(params, "id")) do
			:delete
		end	
	end

	def update(conn, params) do
		with {:ok, todo} <- Todo.update_todo(Map.get(params, "id"), params),
		do: render(conn, TodoView, "show.json", todo: todo)
	end
end