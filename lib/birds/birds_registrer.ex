defmodule Birds.BirdsRegistrer do
  @moduledoc """
  The BirdsRegistrer context.
  """

  import Ecto.Query, warn: false
  alias Birds.Repo

  alias Birds.BirdsRegistrer.BirdRegister

  @doc """
  Returns the list of birds.

  ## Examples

      iex> list_birds()
      [%BirdRegister{}, ...]

  """
  def list_birds do
    Repo.all(BirdRegister)
  end

  @doc """
  Gets a single bird_register.

  Raises `Ecto.NoResultsError` if the Bird register does not exist.

  ## Examples

      iex> get_bird_register!(123)
      %BirdRegister{}

      iex> get_bird_register!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bird_register!(id), do: Repo.get!(BirdRegister, id)

  @doc """
  Creates a bird_register.

  ## Examples

      iex> create_bird_register(%{field: value})
      {:ok, %BirdRegister{}}

      iex> create_bird_register(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bird_register(attrs \\ %{}) do
    %BirdRegister{}
    |> BirdRegister.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bird_register.

  ## Examples

      iex> update_bird_register(bird_register, %{field: new_value})
      {:ok, %BirdRegister{}}

      iex> update_bird_register(bird_register, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bird_register(%BirdRegister{} = bird_register, attrs) do
    bird_register
    |> BirdRegister.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BirdRegister.

  ## Examples

      iex> delete_bird_register(bird_register)
      {:ok, %BirdRegister{}}

      iex> delete_bird_register(bird_register)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bird_register(%BirdRegister{} = bird_register) do
    Repo.delete(bird_register)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bird_register changes.

  ## Examples

      iex> change_bird_register(bird_register)
      %Ecto.Changeset{source: %BirdRegister{}}

  """
  def change_bird_register(%BirdRegister{} = bird_register) do
    BirdRegister.changeset(bird_register, %{})
  end
end
