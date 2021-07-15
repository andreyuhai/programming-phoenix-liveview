defmodule Pento.Repo.Migrations.CreateFrequentlyAskedQuestions do
  use Ecto.Migration

  def change do
    create table(:frequently_asked_questions) do
      add :question, :string
      add :answer, :string
      add :vote_count, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:frequently_asked_questions, [:user_id])
  end
end
