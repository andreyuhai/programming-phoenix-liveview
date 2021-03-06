defmodule PentoWeb.FrequentlyAskedQuestionLive.Index do
  use PentoWeb, :live_view

  alias Pento.FAQ
  alias Pento.FAQ.FrequentlyAskedQuestion

  @impl true
  def mount(_params, session, socket) do
    {:ok,
      socket
      |> assign(:frequently_asked_questions, list_frequently_asked_questions())
      |> assign(:current_user, Pento.Accounts.get_user_by_session_token(session["user_token"]))}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    current_user = socket.assigns.current_user
    faq = FAQ.get_frequently_asked_question!(id)

    case faq.user_id == current_user.id do
      true ->
        socket
        |> assign(:page_title, "Edit Frequently asked question")
        |> assign(:frequently_asked_question, faq)
      false ->
        socket
        |> put_flash(:info, "You can not edit this FAQ!")
        |> push_redirect(to: Routes.frequently_asked_question_index_path(socket, :index))
    end
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Frequently asked question")
    |> assign(:frequently_asked_question, %FrequentlyAskedQuestion{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Frequently asked questions")
    |> assign(:frequently_asked_question, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    frequently_asked_question = FAQ.get_frequently_asked_question!(id)
    {:ok, _} = FAQ.delete_frequently_asked_question(frequently_asked_question)

    {:noreply, assign(socket, :frequently_asked_questions, list_frequently_asked_questions())}
  end

  def handle_event("upvote", %{"id" => id}, socket) do
    frequently_asked_question = FAQ.get_frequently_asked_question!(id)
    {:ok, f} = FAQ.upvote_frequently_asked_question(frequently_asked_question)

    {:noreply, assign(socket, :frequently_asked_questions, list_frequently_asked_questions())}
  end

  defp list_frequently_asked_questions do
    FAQ.list_frequently_asked_questions()
  end
end
