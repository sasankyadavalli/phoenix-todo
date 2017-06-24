defmodule PhoenixTodo.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use PhoenixTodo.Web, :controller
      use PhoenixTodo.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: PhoenixTodo.Web
      import Plug.Conn
      import PhoenixTodo.Web.Router.Helpers
      import PhoenixTodo.Web.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/phoenix_todo/web/templates",
                        namespace: PhoenixTodo.Web

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import PhoenixTodo.Web.Router.Helpers
      import PhoenixTodo.Web.ErrorHelpers
      import PhoenixTodo.Web.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import PhoenixTodo.Web.Gettext
    end
  end

  def schema do
    quote do
      use Ecto.Schema

      # use binary ids for all keys
      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end
  
  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
