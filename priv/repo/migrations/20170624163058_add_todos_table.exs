defmodule PhoenixTodo.Repo.Migrations.AddTodosTable do
  use Ecto.Migration

  def up do
    create table(:todos, primary_key: false) do
      add :id, :binary_id, primary_key: false
      add :todo, :string
      add :description, :string
      add :completed, :boolean, default: false

      timestamps()
    end
  end

  def down do
    drop table(:todos)
  end
end
