defmodule Birds.BirdsRegistrer.BirdRegister do
  use Ecto.Schema
  import Ecto.Changeset

  schema "birds" do
    field :location, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(bird_register, attrs) do
    bird_register
    |> cast(attrs, [:name, :location])
    |> validate_required([:name, :location])
  end
end
