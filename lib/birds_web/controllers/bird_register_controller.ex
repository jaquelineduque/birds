defmodule BirdsWeb.BirdRegisterController do
  use BirdsWeb, :controller

  alias Birds.BirdsRegistrer
  alias Birds.BirdsRegistrer.BirdRegister

  action_fallback BirdsWeb.FallbackController

  def index(conn, _params) do
    birds = BirdsRegistrer.list_birds()
    render(conn, "index.json", birds: birds)
  end

  def create(conn, %{"bird_register" => bird_register_params}) do
    with {:ok, %BirdRegister{} = bird_register} <- BirdsRegistrer.create_bird_register(bird_register_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.bird_register_path(conn, :show, bird_register))
      |> render("show.json", bird_register: bird_register)
    end
  end

  def show(conn, %{"id" => id}) do
    bird_register = BirdsRegistrer.get_bird_register!(id)
    render(conn, "show.json", bird_register: bird_register)
  end

  def update(conn, %{"id" => id, "bird_register" => bird_register_params}) do
    bird_register = BirdsRegistrer.get_bird_register!(id)

    with {:ok, %BirdRegister{} = bird_register} <- BirdsRegistrer.update_bird_register(bird_register, bird_register_params) do
      render(conn, "show.json", bird_register: bird_register)
    end
  end

  def delete(conn, %{"id" => id}) do
    bird_register = BirdsRegistrer.get_bird_register!(id)

    with {:ok, %BirdRegister{}} <- BirdsRegistrer.delete_bird_register(bird_register) do
      send_resp(conn, :no_content, "")
    end
  end
end
