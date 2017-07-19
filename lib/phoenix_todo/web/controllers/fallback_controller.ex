defmodule PhoenixTodo.Web.FallbackController do
	
	@moduledoc false

	use PhoenixTodo.Web, :controller
	alias PhoenixTodo.Web.FallbackView

	def call(conn, :delete) do
		conn
		|> put_status(:no_content)
		|> render(FallbackView, "delete.json", %{})
	end
end