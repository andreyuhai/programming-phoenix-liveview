defmodule PentoWeb.FrequentlyAskedQuestionLive.FormComponent do
  use PentoWeb, :live_component

  alias Pento.FAQ

  @impl true
  def update(%{frequently_asked_question: frequently_asked_question} = assigns, socket) do
    changeset = FAQ.change_frequently_asked_question(frequently_asked_question)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"frequently_asked_question" => frequently_asked_question_params}, socket) do
    changeset =
      socket.assigns.frequently_asked_question
      |> FAQ.change_frequently_asked_question(frequently_asked_question_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"frequently_asked_question" => frequently_asked_question_params}, socket) do
    save_frequently_asked_question(socket, socket.assigns.action, frequently_asked_question_params)
  end

  defp save_frequently_asked_question(socket, :edit, frequently_asked_question_params) do
    case FAQ.update_frequently_asked_question(socket.assigns.frequently_asked_question, frequently_asked_question_params) do
      {:ok, _frequently_asked_question} ->
        {:noreply,
         socket
         |> put_flash(:info, "Frequently asked question updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_frequently_asked_question(socket, :new, frequently_asked_question_params) do
    case FAQ.create_frequently_asked_question(frequently_asked_question_params) do
      {:ok, _frequently_asked_question} ->
        {:noreply,
         socket
         |> put_flash(:info, "Frequently asked question created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
