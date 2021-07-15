defmodule Pento.FAQ do
  @moduledoc """
  The FAQ context.
  """

  import Ecto.Query, warn: false
  alias Pento.Repo

  alias Pento.FAQ.FrequentlyAskedQuestion

  @doc """
  Returns the list of frequently_asked_questions.

  ## Examples

      iex> list_frequently_asked_questions()
      [%FrequentlyAskedQuestion{}, ...]

  """
  def list_frequently_asked_questions do
    Repo.all(FrequentlyAskedQuestion)
  end

  @doc """
  Gets a single frequently_asked_question.

  Raises `Ecto.NoResultsError` if the Frequently asked question does not exist.

  ## Examples

      iex> get_frequently_asked_question!(123)
      %FrequentlyAskedQuestion{}

      iex> get_frequently_asked_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_frequently_asked_question!(id), do: Repo.get!(FrequentlyAskedQuestion, id)

  @doc """
  Creates a frequently_asked_question.

  ## Examples

      iex> create_frequently_asked_question(%{field: value})
      {:ok, %FrequentlyAskedQuestion{}}

      iex> create_frequently_asked_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_frequently_asked_question(attrs \\ %{}) do
    %FrequentlyAskedQuestion{}
    |> FrequentlyAskedQuestion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a frequently_asked_question.

  ## Examples

      iex> update_frequently_asked_question(frequently_asked_question, %{field: new_value})
      {:ok, %FrequentlyAskedQuestion{}}

      iex> update_frequently_asked_question(frequently_asked_question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_frequently_asked_question(%FrequentlyAskedQuestion{} = frequently_asked_question, attrs) do
    frequently_asked_question
    |> FrequentlyAskedQuestion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a frequently_asked_question.

  ## Examples

      iex> delete_frequently_asked_question(frequently_asked_question)
      {:ok, %FrequentlyAskedQuestion{}}

      iex> delete_frequently_asked_question(frequently_asked_question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_frequently_asked_question(%FrequentlyAskedQuestion{} = frequently_asked_question) do
    Repo.delete(frequently_asked_question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking frequently_asked_question changes.

  ## Examples

      iex> change_frequently_asked_question(frequently_asked_question)
      %Ecto.Changeset{data: %FrequentlyAskedQuestion{}}

  """
  def change_frequently_asked_question(%FrequentlyAskedQuestion{} = frequently_asked_question, attrs \\ %{}) do
    FrequentlyAskedQuestion.changeset(frequently_asked_question, attrs)
  end
end
