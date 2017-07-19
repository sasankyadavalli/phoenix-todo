defmodule PhoenixTodo.Web.TodoView do
	@moduledoc false

	use PhoenixTodo.Web, :view

	def render("index.json", %{todos: todos}) do
		%{data: Enum.map(todos, &todo_json/1)}
	end

	def render("show.json", %{todo: todo}) do
		%{data: todo_json(todo)}
	end

	def todo_json(todo) do
		%{
		   id: todo.id,
		   todo: todo.todo,
		   description: todo.description,
		   completed: todo.completed	
		 }
	end
end