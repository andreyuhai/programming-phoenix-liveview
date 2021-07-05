defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  def mount(_params, session, socket) do
    {
      :ok,
      assign(
        socket,
        score: 0,
        message: "Guess a number.",
        num: :rand.uniform(10) |> to_string(),
        answered_correctly: false,
        user: Pento.Accounts.get_user_by_session_token(session["user_token"]),
        session_id: session["live_socket_id"]
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
        score: score,
        answered_correctly: true
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
    <%= if @answered_correctly do %>
      <%= live_redirect "Restart", to: Routes.live_path(@socket, PentoWeb.WrongLive) %>
    <% else %>
      <h2>
        <%= for n <- 1..10 do %>
          <a href="#" phx-click="guess" phx-value-number="<%= n %>"><%= n %></a>
        <% end %>
      </h2>
    <% end %>
    <pre>
      <%= @user.email %>
      <%= @session_id %>
    </pre>
    """
  end
end
