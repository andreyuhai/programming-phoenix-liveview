defmodule Pento.FAQ.FrequentlyAskedQuestion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "frequently_asked_questions" do
    field :answer, :string
    field :question, :string
    field :vote_count, :integer, default: 0
    belongs_to :user, Pento.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(frequently_asked_question, attrs) do
    frequently_asked_question
    |> cast(attrs, [:question, :answer, :vote_count])
    |> validate_required([:question, :answer, :vote_count])
  end
end
