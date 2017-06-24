defmodule PhoenixTodo.Todo.TodoSchema do
  @moduledoc false

  use PhoenixTodo.Web, :schema

  schema "todos" do
    field :todo, :string
    field :description, :string
    field :completed, :boolean, default: false

    timestamps()
  end

  @fields [:todo, :description, :completed]
  @required_fields [:todo]

  def changeset(todo, params \\ %{}) do
    todo
    |> cast(params, @fields)
    |> validate_required(@required_fields)
  end
end