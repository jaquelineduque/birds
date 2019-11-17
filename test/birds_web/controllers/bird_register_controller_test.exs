defmodule BirdsWeb.BirdRegisterControllerTest do
  use BirdsWeb.ConnCase

  alias Birds.BirdsRegistrer
  alias Birds.BirdsRegistrer.BirdRegister

  @create_attrs %{
    location: "some location",
    name: "some name"
  }
  @update_attrs %{
    location: "some updated location",
    name: "some updated name"
  }
  @invalid_attrs %{location: nil, name: nil}

  def fixture(:bird_register) do
    {:ok, bird_register} = BirdsRegistrer.create_bird_register(@create_attrs)
    bird_register
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all birds", %{conn: conn} do
      conn = get(conn, Routes.bird_register_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create bird_register" do
    test "renders bird_register when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bird_register_path(conn, :create), bird_register: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.bird_register_path(conn, :show, id))

      assert %{
               "id" => id,
               "location" => "some location",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bird_register_path(conn, :create), bird_register: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update bird_register" do
    setup [:create_bird_register]

    test "renders bird_register when data is valid", %{conn: conn, bird_register: %BirdRegister{id: id} = bird_register} do
      conn = put(conn, Routes.bird_register_path(conn, :update, bird_register), bird_register: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.bird_register_path(conn, :show, id))

      assert %{
               "id" => id,
               "location" => "some updated location",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, bird_register: bird_register} do
      conn = put(conn, Routes.bird_register_path(conn, :update, bird_register), bird_register: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete bird_register" do
    setup [:create_bird_register]

    test "deletes chosen bird_register", %{conn: conn, bird_register: bird_register} do
      conn = delete(conn, Routes.bird_register_path(conn, :delete, bird_register))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.bird_register_path(conn, :show, bird_register))
      end
    end
  end

  defp create_bird_register(_) do
    bird_register = fixture(:bird_register)
    {:ok, bird_register: bird_register}
  end
end
