defmodule PentoWeb.FrequentlyAskedQuestionLive.Show do
  use PentoWeb, :live_view

  alias Pento.FAQ

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:frequently_asked_question, FAQ.get_frequently_asked_question!(id))}
  end

  defp page_title(:show), do: "Show Frequently asked question"
  defp page_title(:edit), do: "Edit Frequently asked question"
end
