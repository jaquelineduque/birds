defmodule Birds.BirdsRegistrerTest do
  use Birds.DataCase

  alias Birds.BirdsRegistrer

  describe "birds" do
    alias Birds.BirdsRegistrer.BirdRegister

    @valid_attrs %{location: "some location", name: "some name"}
    @update_attrs %{location: "some updated location", name: "some updated name"}
    @invalid_attrs %{location: nil, name: nil}

    def bird_register_fixture(attrs \\ %{}) do
      {:ok, bird_register} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BirdsRegistrer.create_bird_register()

      bird_register
    end

    test "list_birds/0 returns all birds" do
      bird_register = bird_register_fixture()
      assert BirdsRegistrer.list_birds() == [bird_register]
    end

    test "get_bird_register!/1 returns the bird_register with given id" do
      bird_register = bird_register_fixture()
      assert BirdsRegistrer.get_bird_register!(bird_register.id) == bird_register
    end

    test "create_bird_register/1 with valid data creates a bird_register" do
      assert {:ok, %BirdRegister{} = bird_register} = BirdsRegistrer.create_bird_register(@valid_attrs)
      assert bird_register.location == "some location"
      assert bird_register.name == "some name"
    end

    test "create_bird_register/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BirdsRegistrer.create_bird_register(@invalid_attrs)
    end

    test "update_bird_register/2 with valid data updates the bird_register" do
      bird_register = bird_register_fixture()
      assert {:ok, %BirdRegister{} = bird_register} = BirdsRegistrer.update_bird_register(bird_register, @update_attrs)
      assert bird_register.location == "some updated location"
      assert bird_register.name == "some updated name"
    end

    test "update_bird_register/2 with invalid data returns error changeset" do
      bird_register = bird_register_fixture()
      assert {:error, %Ecto.Changeset{}} = BirdsRegistrer.update_bird_register(bird_register, @invalid_attrs)
      assert bird_register == BirdsRegistrer.get_bird_register!(bird_register.id)
    end

    test "delete_bird_register/1 deletes the bird_register" do
      bird_register = bird_register_fixture()
      assert {:ok, %BirdRegister{}} = BirdsRegistrer.delete_bird_register(bird_register)
      assert_raise Ecto.NoResultsError, fn -> BirdsRegistrer.get_bird_register!(bird_register.id) end
    end

    test "change_bird_register/1 returns a bird_register changeset" do
      bird_register = bird_register_fixture()
      assert %Ecto.Changeset{} = BirdsRegistrer.change_bird_register(bird_register)
    end
  end
end
