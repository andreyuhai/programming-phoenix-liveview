defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    {
      :ok,
      assign(
        socket,
        score: 0,
        message: "Guess a number.",
        num: :rand.uniform(10) |> to_string()
      )
    }
  end

  def handle_event("guess", %{"number" => guess} = data, %{assigns: %{num: guess}} = socket) do
    correct_answer_msg = "You won! The number was #{guess}"
    score = socket.assigns.score + 1

    {
      :noreply,
      assign(
        socket,
        message: correct_answer_msg,
        score: score
      )
    }
  end

  def handle_event("guess", %{"number" => guess} = data, %{assigns: %{num: num}} = socket) do
    wrong_answer_msg = "Your guess: #{guess}. Wrong. Guess again."
    score = socket.assigns.score - 1

    {
      :noreply,
      assign(
        socket,
        message: wrong_answer_msg,
        score: score
      )
    }
  end

  def render(assigns) do
    ~L"""
    <h1>Your score: <%= @score %></h1>
    <h2>
      <%= @message %>
    </h2>
    <h2>
      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number="<%= n %>"><%= n %></a>
      <% end %>
    </h2>
    """
  end
end
