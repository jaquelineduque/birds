defmodule BirdsWeb.BirdRegisterView do
  use BirdsWeb, :view
  alias BirdsWeb.BirdRegisterView

  def render("index.json", %{birds: birds}) do
    %{data: render_many(birds, BirdRegisterView, "bird_register.json")}
  end

  def render("show.json", %{bird_register: bird_register}) do
    %{data: render_one(bird_register, BirdRegisterView, "bird_register.json")}
  end

  def render("bird_register.json", %{bird_register: bird_register}) do
    %{id: bird_register.id,
      name: bird_register.name,
      location: bird_register.location}
  end
end
