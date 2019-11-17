defmodule Birds.Repo.Migrations.CreateBirds do
  use Ecto.Migration

  def change do
    create table(:birds) do
      add :name, :string
      add :location, :string

      timestamps()
    end

  end
end
