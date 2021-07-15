defmodule PentoWeb.FrequentlyAskedQuestionLiveTest do
  use PentoWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Pento.FAQ

  @create_attrs %{answer: "some answer", question: "some question", vote_count: 42}
  @update_attrs %{answer: "some updated answer", question: "some updated question", vote_count: 43}
  @invalid_attrs %{answer: nil, question: nil, vote_count: nil}

  defp fixture(:frequently_asked_question) do
    {:ok, frequently_asked_question} = FAQ.create_frequently_asked_question(@create_attrs)
    frequently_asked_question
  end

  defp create_frequently_asked_question(_) do
    frequently_asked_question = fixture(:frequently_asked_question)
    %{frequently_asked_question: frequently_asked_question}
  end

  describe "Index" do
    setup [:create_frequently_asked_question]

    test "lists all frequently_asked_questions", %{conn: conn, frequently_asked_question: frequently_asked_question} do
      {:ok, _index_live, html} = live(conn, Routes.frequently_asked_question_index_path(conn, :index))

      assert html =~ "Listing Frequently asked questions"
      assert html =~ frequently_asked_question.answer
    end

    test "saves new frequently_asked_question", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.frequently_asked_question_index_path(conn, :index))

      assert index_live |> element("a", "New Frequently asked question") |> render_click() =~
               "New Frequently asked question"

      assert_patch(index_live, Routes.frequently_asked_question_index_path(conn, :new))

      assert index_live
             |> form("#frequently_asked_question-form", frequently_asked_question: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#frequently_asked_question-form", frequently_asked_question: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.frequently_asked_question_index_path(conn, :index))

      assert html =~ "Frequently asked question created successfully"
      assert html =~ "some answer"
    end

    test "updates frequently_asked_question in listing", %{conn: conn, frequently_asked_question: frequently_asked_question} do
      {:ok, index_live, _html} = live(conn, Routes.frequently_asked_question_index_path(conn, :index))

      assert index_live |> element("#frequently_asked_question-#{frequently_asked_question.id} a", "Edit") |> render_click() =~
               "Edit Frequently asked question"

      assert_patch(index_live, Routes.frequently_asked_question_index_path(conn, :edit, frequently_asked_question))

      assert index_live
             |> form("#frequently_asked_question-form", frequently_asked_question: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#frequently_asked_question-form", frequently_asked_question: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.frequently_asked_question_index_path(conn, :index))

      assert html =~ "Frequently asked question updated successfully"
      assert html =~ "some updated answer"
    end

    test "deletes frequently_asked_question in listing", %{conn: conn, frequently_asked_question: frequently_asked_question} do
      {:ok, index_live, _html} = live(conn, Routes.frequently_asked_question_index_path(conn, :index))

      assert index_live |> element("#frequently_asked_question-#{frequently_asked_question.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#frequently_asked_question-#{frequently_asked_question.id}")
    end
  end

  describe "Show" do
    setup [:create_frequently_asked_question]

    test "displays frequently_asked_question", %{conn: conn, frequently_asked_question: frequently_asked_question} do
      {:ok, _show_live, html} = live(conn, Routes.frequently_asked_question_show_path(conn, :show, frequently_asked_question))

      assert html =~ "Show Frequently asked question"
      assert html =~ frequently_asked_question.answer
    end

    test "updates frequently_asked_question within modal", %{conn: conn, frequently_asked_question: frequently_asked_question} do
      {:ok, show_live, _html} = live(conn, Routes.frequently_asked_question_show_path(conn, :show, frequently_asked_question))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Frequently asked question"

      assert_patch(show_live, Routes.frequently_asked_question_show_path(conn, :edit, frequently_asked_question))

      assert show_live
             |> form("#frequently_asked_question-form", frequently_asked_question: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#frequently_asked_question-form", frequently_asked_question: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.frequently_asked_question_show_path(conn, :show, frequently_asked_question))

      assert html =~ "Frequently asked question updated successfully"
      assert html =~ "some updated answer"
    end
  end
end
