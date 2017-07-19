defmodule PhoenixTodo.Web.FallbackView do
	@moduledoc false

	use PhoenixTodo.Web, :view

	def render("delete.json", _assigns) do
		%{data: %{message: "Successfully deleted"}}
	end
end